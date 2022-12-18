import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final Function(String) onsaved;
  final String regEx;
  final String hintText;
  final bool obscureText;
  Widget? modal;
  ScrollController? controller;

  CustomTextFormField({
    super.key,
    required this.onsaved,
    required this.regEx,
    required this.hintText,
    required this.obscureText,
    this.modal,
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
        controller?.animateTo(120.0,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
        // showBottomSheet(
        //     context: context,
        //     builder: (context) => Container(
        //           padding: EdgeInsets.only(
        //             bottom: MediaQuery.of(context).viewInsets.bottom,
        //           ),
        //         ));
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
}
