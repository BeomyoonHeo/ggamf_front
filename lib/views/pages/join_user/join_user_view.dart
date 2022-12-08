import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/views/pages/join_user/components/agreement_provision_of_personal_information_modal.dart';
import 'package:ggamf_front/views/pages/join_user/components/certification_number_button.dart';
import 'package:ggamf_front/views/pages/join_user/components/confirm_join_user_button.dart';
import 'package:ggamf_front/views/pages/join_user/components/email_dropdown_button.dart';
import 'package:ggamf_front/views/pages/join_user/components/input_box.dart';
import 'package:ggamf_front/views/pages/join_user/components/input_email_box.dart';
import 'package:ggamf_front/views/pages/join_user/components/input_phonenumber_widget.dart';

class JoinUserView extends ConsumerWidget {
  JoinUserView({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String validation = '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('회원가입 페이지'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        color: const Color(0xFFFFFBFE),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xFFFFFBFE)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InputBox(
                      inputText: "이름 : ",
                      hintText: "이름을 입력하세요",
                      controller: nameController),
                  const SizedBox(height: 10),
                  InputBox(
                      inputText: "아이디 : ",
                      hintText: "아이디를 입력하세요",
                      controller: idController),
                  const SizedBox(height: 10),
                  InputBox(
                      inputText: "비밀번호 : ",
                      hintText: "비밀번호를 입력하세요",
                      controller: passwordController),
                  const SizedBox(height: 10),
                  InputBox(
                      inputText: "비밀번호 확인 : ",
                      hintText: "비밀번호를 입력하세요",
                      controller: null),
                  const SizedBox(height: 10),
                  InputPhoneNumberWidget(),
                  SizedBox(height: 10),
                  CertificationNumberButton(
                      certificationText: '인증되지 않음',
                      phoneNumber: phoneNumberController.text),
                  SizedBox(height: 10),
                  InputBox(
                    inputText: "닉네임 : ",
                    hintText: "닉네임 입력",
                    controller: nickNameController,
                  ),
                  SizedBox(height: 10),
                  InputEmailBox(),
                  SizedBox(height: 10),
                  EmailDropdownButton(),
                  SizedBox(height: 10),
                  AgreementProvisionOfPersonalInformationModal(),
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
