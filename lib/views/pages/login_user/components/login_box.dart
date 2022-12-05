import 'package:flutter/material.dart';
import 'package:ggamf_front/core/page_enum.dart';
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
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              ItemButton(
                text: "아이디|비밀번호찾기",
                function: () {},
              ),
              SizedBox(height: 10),
              ItemButton(
                  text: "회원가입",
                  function: () {
                    Navigator.pushNamed(context,
                        PageEnum.getByDisPlayName('join').requestLocation);
                  }),
              SizedBox(height: 10),
              ItemButton(
                  text: "로그인",
                  function: () {
                    Navigator.pushNamed(context,
                        PageEnum.getByDisPlayName('allpages').requestLocation);
                  }),
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
      padding: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: 1)),
      width: 300,
      child: InkWell(
        onTap: () {
          function();
        },
        overlayColor: MaterialStatePropertyAll(Colors.white),
        // style: ButtonStyle(
        //   backgroundColor: const MaterialStatePropertyAll<Color>(kPrimaryColor),
        //   shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
        //     RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(30),
        //     ),
        //   ),
        // ),
        child: Text(
          text,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
