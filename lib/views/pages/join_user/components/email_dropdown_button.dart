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
  final _emailEditController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailEditController.dispose();
    super.dispose();
  }

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
      crossAxisAlignment: CrossAxisAlignment.center,
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
                _emailEditController.text = '';
              } else if (value == '선택') {
                _emailEditController.text = '';
                _enableTextField = false;
              } else {
                _enableTextField = true;
                _emailEditController.text = value;
                _enableTextField = false;
              }
            });
          },
        ),
        Expanded(
          child: Container(
            height: 35,
            child: TextField(
              controller: _emailEditController,
              decoration: InputDecoration(
                hintText: '이메일 입력',
              ),
              enabled: _enableTextField,
            ),
          ),
        ),
      ],
    );
  }
}
