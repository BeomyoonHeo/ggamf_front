import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../core/color.dart';
import 'chatting_components/chat_icon_button.dart';
import 'chatting_components/my_chat.dart';
import 'chatting_components/other_chat.dart';

class ChattingView extends StatefulWidget {
  final dio = Dio();
  ChattingView({Key? key}) : super(key: key);

  @override
  State<ChattingView> createState() => _ChattingViewState();
}

class _ChattingViewState extends State<ChattingView> {
  final List<MyChat> chats = [];
  final TextEditingController _textController = TextEditingController();
  bool _ischecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFb2c7da),
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          appBar: _AppBar(context),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        OtherChat(
                          num: 0,
                          name: "홍길동",
                          time: "오후 8:10",
                          text: "오늘 10시에 자랭 돌립시다",
                        ),
                        SizedBox(height: 20),
                        OtherChat(
                          num: 1,
                          name: "임꺽정",
                          time: "오후 8:15",
                          text: "10시는 너무 늦고 9시에 돌립시다",
                        ),
                        SizedBox(height: 20),
                        MyChat(
                          text: "9시도 늦다 8시에 돌리자",
                          time: "오후 8:15",
                        ),
                        SizedBox(height: 20),
                        OtherChat(
                          num: 2,
                          name: "김유미",
                          time: "오전 10:10",
                          text: "다들 포지션 뭘로 하실거에요?",
                        ),
                        SizedBox(height: 20),
                        OtherChat(
                          num: 2,
                          name: "김유미",
                          time: "오전 10:10",
                          text: "저는 탑 할게요",
                        ),
                        SizedBox(height: 20),
                        MyChat(
                          text: "그럼 저는 탑할게요",
                          time: "오후 2:15",
                        ),
                        ...List.generate(chats.length, (index) => chats[index]),
                      ],
                    ),
                  ),
                ),
              ),
              _chattingBox()
            ],
          ),
        ),
      ),
    );
  }

  Widget _chattingBox() {
    return Container(
      padding: EdgeInsets.only(right: 20),
      height: 60,
      color: Colors.white,
      child: Row(
        children: [
          ChatIconButton(icon: Icon(FontAwesomeIcons.plusSquare)),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: _textController,
                maxLines: 1,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                onSubmitted: _handleSubmitted,
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _AppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          BackButton(color: Colors.black),
          Text(
            "채팅",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            showDialog(context: context, builder: (_) => _invite());
          },
          child: Text(
            "초대하기",
            style: TextStyle(fontSize: 12, color: Colors.green),
          ),
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
          ),
        ),
        SizedBox(width: 20),
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => CupertinoAlertDialog(
                title: Text("확인"),
                content: Text("정말 파티에서 나가시겠습니까?"),
                actions: [
                  CupertinoDialogAction(
                    child: Text("네"),
                    onPressed: () {},
                  ),
                  CupertinoDialogAction(
                    child: Text("아니오"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            );
          },
          child: Icon(Icons.logout, size: 20, color: Colors.black),
        ),
        SizedBox(width: 25),
      ],
    );
  }

  void _handleSubmitted(text) {
    _textController.clear();

    setState(() {
      chats.add(
        MyChat(
          text: text,
          time: DateFormat("a K:m").format(new DateTime.now()).replaceAll("AM", "오전").replaceAll("PM", "오후"),
        ),
      );
    });
  }

  Widget _invite() {
    return Dialog(
      child: Container(
        margin: EdgeInsets.all(20),
        width: double.infinity,
        height: 400,
        child: Column(
          children: [
            Text(
              "초대할 껨프 선택",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 40),
            CheckboxListTile(
              title: Text('껨프 1'),
              secondary: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/76.jpg"),
              ),
              activeColor: Colors.white,
              checkColor: Colors.black,
              controlAffinity: ListTileControlAffinity.trailing,
              value: _ischecked,
              onChanged: (bool? value) {
                setState(() {
                  _ischecked = value!;
                });
              },
            ),
            Divider(color: Colors.black),
            CheckboxListTile(
              title: Text('껨프 2'),
              secondary: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/20.jpg"),
              ),
              activeColor: Colors.white,
              checkColor: Colors.black,
              controlAffinity: ListTileControlAffinity.trailing,
              value: _ischecked,
              onChanged: (bool? value) {
                setState(() {
                  _ischecked = value!;
                });
              },
            ),
            Divider(color: Colors.black),
          ],
        ),
      ),
    );
  }
}
