import 'package:flutter/material.dart';
import 'package:ggamf_front/main.dart';

class CustomTextFormField extends StatelessWidget {
  final Function(String) onsaved;
  final String regEx;
  final String hintText;
  final bool obscureText;
  ScrollController? controller;

  CustomTextFormField({
    super.key,
    required this.onsaved,
    required this.regEx,
    required this.hintText,
    required this.obscureText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (_value) => onsaved(_value!),
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      obscureText: obscureText,
      validator: (_value) {
        return RegExp(regEx).hasMatch(_value!) ? null : '값 입력 필요';
      },
      onTap: () {
        scrollAnimate();
      },
      decoration: InputDecoration(
        fillColor: Color.fromRGBO(30, 29, 37, 1.0),
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white54),
      ),
    );
  }

  void scrollAnimate() {
    print("탭 클릭됨");
    Future.delayed(Duration(milliseconds: 500), () {
      controller?.animateTo(
          MediaQuery.of(navigatorKey.currentState!.context).viewInsets.bottom,
          duration: Duration(milliseconds: 100),
          curve: Curves.easeIn);
    });
  }
}
