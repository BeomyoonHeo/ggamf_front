import 'package:flutter/material.dart';

class ConfirmJoinUserButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  ConfirmJoinUserButton({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  @override
  State<ConfirmJoinUserButton> createState() => _ConfirmJoinUserButtonState();
}

class _ConfirmJoinUserButtonState extends State<ConfirmJoinUserButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(9)),
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: ElevatedButton(
              onPressed: () {
                if (widget.formKey.currentState!.validate()) {
                  print('에러발생');
                }
              },
              child: Text('회원가입'),
              style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.black),
                backgroundColor: MaterialStatePropertyAll(Colors.white),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(width: 1),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
