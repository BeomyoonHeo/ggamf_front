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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: _buildLoginItemColumn(context),
      ),
    );
  }

  Widget _buildLoginItemColumn(context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(9)),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            children: [
              RoundedInputField(
                icon: Icons.person,
                hintText: "아이디입력",
                onChanged: (value) {},
              ),
              const SizedBox(height: 10),
              const RoundedInputPasswordField(),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              ItemButton(
                  text: "로그인",
                  function: () {
                    Navigator.pushNamed(context,
                        PageEnum.getByDisPlayName('allpages').requestLocation);
                  }),
              const SizedBox(height: 10),
              ItemButton(
                  text: "회원가입",
                  function: () {
                    Navigator.pushNamed(context,
                        PageEnum.getByDisPlayName('join').requestLocation);
                  }),
              const SizedBox(height: 10),
              ItemButton(
                text: "아이디|비밀번호찾기",
                function: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ItemButton extends StatefulWidget {
  final text;

  final Function function;
  const ItemButton({
    Key? key,
    this.text,
    required this.function,
  }) : super(key: key);

  @override
  State<ItemButton> createState() => _ItemButtonState();
}

class _ItemButtonState extends State<ItemButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          widget.function();
          setState(() {});
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(width: 1)),
          child: Text(
            widget.text,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
