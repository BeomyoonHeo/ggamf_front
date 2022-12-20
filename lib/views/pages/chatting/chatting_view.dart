import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/chats/model/chat.dart';
import 'package:ggamf_front/domain/chats/model/chat_message.dart';
import 'package:ggamf_front/domain/user/model/ggamf.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/provider/chat_provider.dart';
import 'package:ggamf_front/provider/ggamf_provider.dart';
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
  late final _pageProvider = ref.read(chatPageProvider.notifier);
  late ScrollController _messageListViewController;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await _pageProvider.listenToMessages();
    });
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
    final _pageProviderWatcher = ref.watch(chatPageProvider);
    final _ggmafProvider = ref.read(ggamfProvider.notifier);
    _messageListViewController.notifyListeners();
    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: const [
                BackButton(
                  color: Colors.black,
                ),
                Text('채팅'),
              ],
            ),
            actions: [
              InkWell(
                onTap: () {
                  _showAlertDialog(
                      context: context,
                      titleText: '내 껨프 초대하기',
                      contentText: '',
                      ggafList: _ggmafProvider.myGgamfList,
                      function: () {});
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.center,
                  child: Text(
                    '껨프초대',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.exit_to_app_outlined,
                      color: Colors.black)),

              // InkWell(
              //   onTap: () {},
              //   child: Container(
              //     padding: EdgeInsets.symmetric(horizontal: 5),
              //     alignment: Alignment.center,
              //     child: Text(
              //       '파티 나가기',
              //       style: TextStyle(color: Colors.black),
              //     ),
              //   ),
              // ),
            ],
          ),
          body: SingleChildScrollView(
            controller: _messageListViewController,
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: _deviceWidth * 0.03,
                vertical: _deviceHeight * 0.01,
              ),
              height: _deviceHeight * 0.90,
              width: _deviceWidth * 0.97,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _messagesListView(_pageProviderWatcher),
                    _sendMessageForm(),
                  ]),
            ),
          ),
        );
      },
    );
  }

  Widget _messagesListView(List<ChatMessage> messages) {
    if (messages != null) {
      if (messages.length != 0) {
        return Container(
          height: _deviceHeight * 0.80,
          child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              ChatMessage _message = messages[index];
              bool _isOwnMessage = _message.senderID == UserSession.user.uid;
              return CustomChatListViewTile(
                width: _deviceWidth * 0.5,
                deviceHeight: _deviceHeight,
                isOwnMessage: _isOwnMessage,
                message: _message,
                sender: widget.chat.memebers
                    .where((_m) => _m.uid == _message.senderID)
                    .first,
              );
            },
          ),
        );
      } else {
        return Align(
          alignment: Alignment.center,
          child: Text(
            "인사를 나눠보세요!",
            style: TextStyle(color: Colors.black87),
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
        vertical: _deviceHeight * 0.01,
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
          controller: _messageListViewController,
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

  Future<dynamic> _showAlertDialog({
    required BuildContext context,
    required String titleText,
    String? contentText,
    List<Ggamf>? ggafList,
    required Function function,
  }) {
    List<Widget> ggamfListWidget = [];
    Map<int, bool> checkList = {};
    if (ggafList != null && ggafList.isNotEmpty) {
      for (var ggamf in ggafList) {
        checkList[ggamf.userId] = false;
        ggamfListWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Checkbox(
                  value: checkList[ggamf.userId],
                  onChanged: (value) {
                    setState(() {
                      checkList[ggamf.userId] = !checkList[ggamf.userId]!;
                    });
                  }),
              Text('${ggamf.nickname}'),
            ],
          ),
        );
      }
    }
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('${titleText}'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: ggamfListWidget.isEmpty
                  ? [Text('${contentText}')]
                  : ggamfListWidget,
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromRGBO(35, 204, 81, 1),
                ),
                child: Text('취소'),
              ),
              ElevatedButton(
                onPressed: () {
                  function();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromRGBO(35, 204, 81, 1),
                ),
                child: Text('확인'),
              ),
            ],
          );
        });
  }
}
