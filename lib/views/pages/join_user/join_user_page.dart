import 'package:flutter/material.dart';
import 'package:ggamf_front/core/color.dart';
import 'package:ggamf_front/views/pages/join_user/components/certification_number_button.dart';
import 'package:ggamf_front/views/pages/join_user/components/confirm_join_user_button.dart';
import 'package:ggamf_front/views/pages/join_user/components/email_dropdown_button.dart';
import 'package:ggamf_front/views/pages/join_user/components/input_box.dart';
import 'package:ggamf_front/views/pages/join_user/components/input_email_box.dart';
import 'package:ggamf_front/views/pages/join_user/components/input_phonenumber_widget.dart';

class JoinUserPage extends StatelessWidget {
  const JoinUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        color: Color(0xFFFFFBFE),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: kPrimaryColor),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InputBox(inputText: "이름 : ", hintText: "이름을 입력하세요"),
                  SizedBox(height: 10),
                  InputBox(inputText: "아이디 : ", hintText: "아이디를 입력하세요"),
                  SizedBox(height: 10),
                  InputBox(inputText: "비밀번호 : ", hintText: "비밀번호를 입력하세요"),
                  SizedBox(height: 10),
                  InputBox(inputText: "비밀번호 확인 : ", hintText: "비밀번호를 입력하세요"),
                  SizedBox(height: 10),
                  InputPhoneNumberWidget(),
                  SizedBox(height: 10),
                  CertificationNumberButton(),
                  SizedBox(height: 10),
                  InputBox(inputText: "닉네임 : ", hintText: "닉네임 입력"),
                  SizedBox(height: 10),
                  InputEmailBox(),
                  SizedBox(height: 10),
                  EmailDropdownButton(),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(9)),
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [],
                    ),
                  ),
                  SizedBox(height: 10),
                  ConfirmJoinUserButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
