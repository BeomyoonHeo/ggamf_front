import 'package:flutter/material.dart';

class EmailDropdownButton extends StatefulWidget {
  const EmailDropdownButton({
    Key? key,
  }) : super(key: key);

  @override
  State<EmailDropdownButton> createState() => _EmailDropdownButtonState();
}

class _EmailDropdownButtonState extends State<EmailDropdownButton> {
  String _dropdownItem = '선택';
  bool _enableTextField = false;

  @override
  Widget build(BuildContext context) {
    final List<String> emailList = [
      '선택',
      'naver.com',
      'kakao.com',
      'gmail.com',
      '직접입력'
    ];

    return Row(
      children: [
        DropdownButton(
          value: _dropdownItem,
          items: emailList.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (dynamic value) {
            setState(() {
              _dropdownItem = value;
              if (value == '직접입력') {
                _enableTextField = true;
              } else {
                _enableTextField = false;
              }
            });
          },
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(),
            enabled: _enableTextField,
          ),
        ),
      ],
    );
  }
}
