import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final Function validator;
  final String inputText;
  final String hintText;
  final TextEditingController? controller;
  const InputBox({
    Key? key,
    required this.inputText,
    required this.hintText,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(9)),
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          Text(
            inputText,
            style: TextStyle(fontFamily: 'NanumSquare', fontSize: 15),
          ),
          Expanded(
            child: TextFormField(
              autovalidateMode: AutovalidateMode.always,
              controller: controller,
              validator: validator(),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(fontFamily: 'NanumSquare', fontSize: 15),
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
