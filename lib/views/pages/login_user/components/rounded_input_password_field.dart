import 'package:flutter/material.dart';
import 'package:ggamf_front/views/pages/login_user/components/text_field_container.dart';

class RoundedInputPasswordField extends StatefulWidget {
  const RoundedInputPasswordField({Key? key}) : super(key: key);

  @override
  State<RoundedInputPasswordField> createState() =>
      _RoundedInputPasswordFieldState();
}

class _RoundedInputPasswordFieldState extends State<RoundedInputPasswordField> {
  bool obscureText = true;
  Icon visible = Icon(Icons.visibility);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
          onChanged: (value) {},
          obscureText: obscureText,
          decoration: InputDecoration(
              hintText: "password",
              icon: Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: visible,
                onPressed: () {
                  if (obscureText) {
                    obscureText = !obscureText;
                    visible = Icon(Icons.visibility_off);
                  } else {
                    obscureText = !obscureText;
                    visible = Icon(Icons.visibility);
                  }
                  setState(() {});
                },
              ),
              border: InputBorder.none)),
    );
  }
}
