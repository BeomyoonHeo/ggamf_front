import 'package:flutter/material.dart';
import 'package:ggamf_front/core/color.dart';
import 'package:ggamf_front/views/pages/login_user/components/rounded_input_field.dart';
import 'package:ggamf_front/views/pages/login_user/components/rounded_input_password_field.dart';

class LoginBox extends StatelessWidget {
  const LoginBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        color: Colors.white,
        width: size.width * 0.9,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: _buildLoginItemColumn(context),
      ),
    );
  }

  Column _buildLoginItemColumn(context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          height: size.height * 0.2 + 30,
          decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(9)),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            children: [
              RoundedInputField(
                icon: Icons.person,
                hintText: "아이디입력",
                onChanged: (value) {},
              ),
              SizedBox(height: 10),
              RoundedInputPasswordField(),
              SizedBox(height: 5),
              Container(
                child: Visibility(
                  child: Text("아이디를 입력해주세요 | 비밀번호를 입력해주세요"),
                  visible: false,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ItemButton(
                text: "아이디|비밀번호찾기",
                function: () {},
              ),
              ItemButton(
                  text: "회원가입",
                  function: () {
                    Navigator.pushNamed(context, '/join');
                  }),
              ItemButton(text: "로그인", function: () {}),
            ],
          ),
        )
      ],
    );
  }
}

class ItemButton extends StatelessWidget {
  final text;

  final Function function;
  const ItemButton({
    Key? key,
    this.text,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          function();
        },
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll<Color>(kPrimaryColor),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
