import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/controller/user/join_user_controller.dart';

class EmailDropdownButton extends ConsumerStatefulWidget {
  const EmailDropdownButton({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<EmailDropdownButton> createState() =>
      _EmailDropdownButtonState();
}

class _EmailDropdownButtonState extends ConsumerState<EmailDropdownButton> {
  String _dropdownItem = '선택';
  bool _enableTextField = false;

  @override
  Widget build(BuildContext context) {
    final juc = ref.read(joinUserController);
    final emailEditController = juc.emailDomainController;
    final List<String> emailList = [
      '선택',
      'naver.com',
      'kakao.com',
      'gmail.com',
      '직접입력'
    ];

    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(9)),
      padding: EdgeInsets.all(15),
      child: Row(
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
                  emailEditController.text = '';
                } else if (value == '선택') {
                  emailEditController.text = '';
                  _enableTextField = false;
                } else {
                  _enableTextField = true;
                  emailEditController.text = value;
                  _enableTextField = false;
                }
              });
            },
          ),
          Expanded(
            child: Container(
              height: 35,
              child: TextField(
                controller: emailEditController,
                decoration: InputDecoration(
                  hintText: '이메일 입력',
                ),
                enabled: _enableTextField,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
