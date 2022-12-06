import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/color.dart';

class OtherChat extends StatefulWidget {
  const OtherChat(
      {Key? key,
      required this.name,
      required this.text,
      required this.time,
      required this.num})
      : super(key: key);

  final String name;
  final String text;
  final String time;
  final int num;

  @override
  State<OtherChat> createState() => _OtherChatState();
}

class _OtherChatState extends State<OtherChat> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  showDialog(
                      context: context, builder: (_) => _showDetailOpponent());
                },
                child: CircleAvatar(
                    // backgroundImage: NetworkImage(
                    //     friends[this.widget.num].backgroundImage), // 1
                    ),
              ),
              SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(this.widget.name),
                    Container(
                      child: Text(this.widget.text),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 5),
              Container(
                child: Text(this.widget.time, style: TextStyle(fontSize: 12)),
                padding: EdgeInsets.only(top: 40),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _showDetailOpponent() {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: kPrimaryColor,
      child: Container(
        padding: EdgeInsets.all(10.0),
        width: double.infinity,
        height: 250,
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(CupertinoIcons.xmark),
              ),
            ),
            CircleAvatar(
              radius: 50,
              // backgroundImage:
              // NetworkImage(friends[this.widget.num].backgroundImage), // 1
            ),
            SizedBox(height: 10),
            Text(this.widget.name),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("프로필보기"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kSecondaryColor),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("추방하기"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kSecondaryColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
