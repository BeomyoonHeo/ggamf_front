import 'package:flutter/material.dart';
import 'package:ggamf_front/views/pages/join_user/components/agreement_provision_of_personal_information_modal.dart';
import 'package:ggamf_front/views/pages/join_user/components/certification_number_button.dart';
import 'package:ggamf_front/views/pages/join_user/components/confirm_join_user_button.dart';
import 'package:ggamf_front/views/pages/join_user/components/email_dropdown_button.dart';
import 'package:ggamf_front/views/pages/join_user/components/input_box.dart';
import 'package:ggamf_front/views/pages/join_user/components/input_email_box.dart';
import 'package:ggamf_front/views/pages/join_user/components/input_phonenumber_widget.dart';

class JoinUserView extends StatelessWidget {
  JoinUserView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  FormFieldValidator nameValidator = (value) {
    if (value.length < 1) {
      return '이름은 필수사항입니다.';
    }
    if (value.length < 2) {
      return '이름은 두글자 이상 입력 해주셔야합니다.';
    }
    return null;
  };
  TextEditingController idController = TextEditingController();
  FormFieldValidator idValidator = (value) {
    if (value.length < 1) {
      return '이메일은 필수사항입니다.';
    }

    if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)) {
      return '잘못된 이메일 형식입니다.';
    }
    return null;
  };
  TextEditingController passwordController = TextEditingController();
  FormFieldValidator passwordValidator = (value) {
    if (value.length < 1) {
      return '비밀번호는 필수사항입니다.';
    }

    if (value.length < 8) {
      return '8자 이상 입력해주세요!';
    }
    return null;
  };
  FormFieldValidator passwordRepeatValidator = (value) {
    if (value.length < 1) {
      return '비밀번호는 필수사항입니다.';
    }

    if (value.length < 8) {
      return '8자 이상 입력해주세요!';
    }
    return null;
  };
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  FormFieldValidator nickNameValidator = (value) {
    if (value.length < 1) {
      return '닉네임은 필수사항입니다.';
    }
    if (value.length < 8) {
      return '닉네임은 8자 이상 입력해주세요!';
    }
    return null;
  };
  TextEditingController emailController = TextEditingController();
  FormFieldValidator emailValidator = (value) {
    if (value.length < 1) {
      return '이름은 필수사항입니다.';
    }
    if (value.length < 2) {
      return '이름은 두글자 이상 입력 해주셔야합니다.';
    }
    return null;
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
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
        child: Form(
          key: _formKey,
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
                        validator: nameValidator,
                        inputText: "이름 : ",
                        hintText: "이름을 입력하세요",
                        controller: nameController),
                    const SizedBox(height: 10),
                    InputBox(
                        validator: idValidator,
                        inputText: "아이디 : ",
                        hintText: "아이디를 입력하세요",
                        controller: idController),
                    const SizedBox(height: 10),
                    InputBox(
                        validator: passwordValidator,
                        inputText: "비밀번호 : ",
                        hintText: "비밀번호를 입력하세요",
                        controller: passwordController),
                    const SizedBox(height: 10),
                    InputBox(
                        validator: passwordValidator,
                        inputText: "비밀번호 확인 : ",
                        hintText: "비밀번호를 입력하세요",
                        controller: passwordController),
                    const SizedBox(height: 10),
                    InputPhoneNumberWidget(
                      controller: phoneNumberController,
                    ),
                    const SizedBox(height: 10),
                    CertificationNumberButton(
                        certificationText: '인증되지 않음',
                        phoneNumber: phoneNumberController.text),
                    const SizedBox(height: 10),
                    const SizedBox(height: 10),
                    InputBox(
                      validator: nickNameValidator,
                      inputText: "닉네임 : ",
                      hintText: "닉네임 입력",
                      controller: nickNameController,
                    ),
                    SizedBox(height: 10),
                    InputEmailBox(
                        controller: emailController, validator: emailValidator),
                    SizedBox(height: 10),
                    EmailDropdownButton(),
                    SizedBox(height: 10),
                    AgreementProvisionOfPersonalInformationModal(),
                    SizedBox(height: 10),
                    ConfirmJoinUserButton(formKey: _formKey),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
