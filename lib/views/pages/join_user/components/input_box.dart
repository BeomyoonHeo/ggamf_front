import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final Function validator;
  final String inputText;
  final String hintText;
  final TextEditingController? controller;
  AutovalidateMode? autoValidateMode;
  InputBox(
      {Key? key,
      required this.inputText,
      required this.hintText,
      required this.controller,
      required this.validator,
      this.autoValidateMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(9)),
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              inputText,
              style: const TextStyle(fontFamily: 'NanumSquare', fontSize: 15),
            ),
          ),
          Expanded(
            child: TextFormField(
              autovalidateMode: autoValidateMode ?? AutovalidateMode.disabled,
              controller: controller,
              validator: validator(),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle:
                    const TextStyle(fontFamily: 'NanumSquare', fontSize: 15),
                filled: true,
                fillColor: Colors.white,
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 0.3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
