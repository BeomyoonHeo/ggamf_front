import 'package:flutter/material.dart';
import 'package:ggamf_front/views/pages/login_user/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final Function validator;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        validator: validator(),
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(icon, color: Color.fromRGBO(35, 204, 81, 1)),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
