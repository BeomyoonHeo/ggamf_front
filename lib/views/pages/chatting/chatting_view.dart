import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/chats/model/chat.dart';
import 'package:ggamf_front/domain/chats/model/chat_message.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/provider/chat_provider.dart';
import 'package:ggamf_front/views/pages/chatting/chatting_components/custom_text_form_field.dart';
import 'package:ggamf_front/views/pages/chatting/chatting_components/custom_view_tiles.dart';

class ChatPage extends ConsumerStatefulWidget {
  final Chat chat;

  const ChatPage({super.key, required this.chat});

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  late double _deviceHeight;
  late double _deviceWidth;

  late GlobalKey<FormState> _messageFormState;
  late final _pageProvider;
  late ScrollController _messageListViewController;

  @override
  void initState() {
    super.initState();
    _messageFormState = GlobalKey<FormState>();
    _messageListViewController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;

    return _buildUI();
  }

  Widget _buildUI() {
    return Builder(
      builder: (context) {
        _pageProvider = ref.watch(chatPageProvider.notifier);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('채팅'),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: _deviceWidth * 0.03,
                vertical: _deviceHeight * 0.02,
              ),
              height: _deviceHeight * 0.98,
              width: _deviceWidth * 0.97,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _messagesListView(),
                  _sendMessageForm(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _messagesListView() {
    if (_pageProvider.messages != null) {
      if (_pageProvider.messages!.length != 0) {
        return Container(
          height: _deviceHeight * 0.74,
          child: ListView.builder(
            itemCount: _pageProvider.messages!.length,
            itemBuilder: (context, index) {
              ChatMessage _message = _pageProvider.messages![index];
              bool _isOwnMessage = _message.senderID == UserSession.user.uid;
              return Container(
                child: CustomChatListViewTile(
                  width: _deviceWidth * 0.8,
                  deviceHeight: _deviceHeight,
                  isOwnMessage: _isOwnMessage,
                  message: _message,
                  sender: this
                      .widget
                      .chat
                      .memebers
                      .where((_m) => _m.uid == _message.senderID)
                      .first,
                ),
              );
            },
          ),
        );
      } else {
        return Align(
          alignment: Alignment.center,
          child: Text(
            "인사를 나눠보세요!",
            style: TextStyle(color: Colors.white),
          ),
        );
      }
    } else {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      );
    }
  }

  Widget _sendMessageForm() {
    return Container(
      height: _deviceHeight * 0.06,
      decoration: BoxDecoration(
        color: Color.fromRGBO(30, 29, 37, 1.0),
        borderRadius: BorderRadius.circular(100),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: _deviceWidth * 0.04,
        vertical: _deviceHeight * 0.001,
      ),
      child: Form(
        key: _messageFormState,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _messageTextField(),
            _sendMessageButton(),
            _imageMessageButton(),
          ],
        ),
      ),
    );
  }

  Widget _messageTextField() {
    return SizedBox(
      width: _deviceWidth * 0.50,
      child: CustomTextFormField(
          onsaved: (_value) {
            _pageProvider.message = _value;
          },
          regEx: r"^(?!\s*$).+",
          hintText: '메세지를 적어주세요',
          obscureText: false),
    );
  }

  Widget _sendMessageButton() {
    double _size = _deviceHeight * 0.04;
    return Container(
      width: _size,
      height: _size,
      margin: EdgeInsets.only(bottom: 10, right: 5),
      child: IconButton(
        icon: Icon(
          Icons.send,
          color: Colors.white,
        ),
        onPressed: () {
          if (_messageFormState.currentState!.validate()) {
            _messageFormState.currentState!.save();
            _pageProvider.sendTextMessge();
            _messageFormState.currentState!.reset();
          }
        },
      ),
    );
  }

  Widget _imageMessageButton() {
    double _size = _deviceHeight * 0.04;
    return Container(
      height: _size,
      width: _size,
      child: FloatingActionButton(
        backgroundColor: Color.fromRGBO(
          0,
          82,
          218,
          1.0,
        ),
        onPressed: () {},
        child: Icon(Icons.camera_enhance),
      ),
    );
  }
}
