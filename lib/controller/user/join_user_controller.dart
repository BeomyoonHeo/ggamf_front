import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/join_user.dart';
import 'package:ggamf_front/domain/user/repository/join_user_repository.dart';

final joinUserController = Provider((ref) => JoinUserController());

class JoinUserController {
  bool authOk = false;
  bool isAgree = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<TextEditingController> phoneNumberController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  TextEditingController nickNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String combinePhoneNumber() {
    // 비지니스 로직
    String phoneNumber = '';
    phoneNumberController.forEach((_controller) {
      phoneNumber += '${_controller.text} ';
    });

    phoneNumber = phoneNumber.trim();

    return phoneNumber;
  }

  void requestJoin() {
    JoinUser joinUser = JoinUser(
      name: nameController.text,
      loginId: idController.text,
      password: passwordController.text,
      phoneNumber: combinePhoneNumber(),
      nickname: nickNameController.text,
      email: emailController.text,
      isAgree: isAgree,
    );
    JoinUserRepository joinUserRepository = JoinUserRepository(Dio());
    joinUserRepository.insert(joinUser);
  }
}
