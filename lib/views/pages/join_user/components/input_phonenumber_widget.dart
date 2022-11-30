import 'package:flutter/material.dart';

class InputPhoneNumberWidget extends StatelessWidget {
  const InputPhoneNumberWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(9)),
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "전화번호 : ",
            style: TextStyle(fontFamily: 'NanumSquare', fontSize: 15),
          ),
          Container(
            width: 50,
            height: 30,
            decoration: BoxDecoration(
                border: Border.all(width: 1), color: Colors.white),
            child: TextField(
              maxLength: 3,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                counterText: '',
              ),
              style: TextStyle(fontSize: 12, height: 2.0),
            ),
          ),
          Text(
            " - ",
            style: TextStyle(fontFamily: 'NanumSquare', fontSize: 15),
          ),
          Container(
            width: 60,
            height: 30,
            decoration: BoxDecoration(
                border: Border.all(width: 1), color: Colors.white),
            child: TextField(
              maxLength: 4,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                counterText: '',
              ),
              style: TextStyle(fontSize: 12, height: 2.0),
            ),
          ),
          Text(
            " - ",
            style: TextStyle(fontFamily: 'NanumSquare', fontSize: 15),
          ),
          Container(
            width: 60,
            height: 30,
            decoration: BoxDecoration(
                border: Border.all(width: 1), color: Colors.white),
            child: TextField(
              maxLength: 4,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                counterText: '',
              ),
              style: TextStyle(fontSize: 12, height: 2.0),
            ),
          ),
        ],
      ),
    );
  }
}
