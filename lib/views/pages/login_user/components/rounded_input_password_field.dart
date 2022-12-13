import 'package:flutter/material.dart';
import 'package:ggamf_front/views/pages/login_user/components/text_field_container.dart';

class RoundedInputPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final Function validator;
  RoundedInputPasswordField(
      {Key? key, required this.controller, required this.validator})
      : super(key: key);

  @override
  State<RoundedInputPasswordField> createState() =>
      _RoundedInputPasswordFieldState();
}

class _RoundedInputPasswordFieldState extends State<RoundedInputPasswordField> {
  bool obscureText = true;
  Icon visible = const Icon(Icons.visibility);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: (value) {},
        obscureText: obscureText,
        controller: widget.controller,
        validator: widget.validator(),
        decoration: InputDecoration(
            hintText: "비밀번호 입력",
            icon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: visible,
              onPressed: () {
                if (obscureText) {
                  visible = const Icon(Icons.visibility_off);
                } else {
                  visible = const Icon(Icons.visibility);
                }
                obscureText = !obscureText;
                setState(() {});
              },
            ),
            border: InputBorder.none),
      ),
    );
  }
}
