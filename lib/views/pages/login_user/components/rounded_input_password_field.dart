import 'package:flutter/material.dart';
import 'package:ggamf_front/views/pages/login_user/components/text_field_container.dart';

class RoundedInputPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedInputPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
          onChanged: onChanged,
          obscureText: true,
          decoration: InputDecoration(
              hintText: "password",
              icon: Icon(Icons.lock),
              suffixIcon: Icon(Icons.visibility),
              border: InputBorder.none)),
    );
  }
}
