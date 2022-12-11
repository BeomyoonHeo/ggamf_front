import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/join_user.dart';
import 'package:ggamf_front/domain/user/repository/join_user_repository.dart';
import 'package:ggamf_front/views/pages/join_user/join_user_view_model.dart';

// 회원가입은 한번만 하면 되기 때문에 회원가입 후 Autodispose를 실행하여 페이지에서 참조가 더이상 일어나지 않는다면 메모리에서 제거 해주기
final joinUserController =
    Provider.autoDispose((ref) => JoinUserController(ref));

class JoinUserController {
  final _ref;
  JoinUserController(this._ref);

  bool authOk = false;
  bool isAgree = false;
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final List<TextEditingController> phoneNumberController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  final TextEditingController nickNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailDomainController = TextEditingController();

  String combinePhoneNumber() {
    // 비지니스 로직
    String phoneNumber = '';
    phoneNumberController.forEach((_controller) {
      phoneNumber += '${_controller.text} ';
    });

    phoneNumber = phoneNumber.trim();

    return phoneNumber;
  }

  void checkAuth() {
    authOk ? _ref.read(joinUserViewModel.notifier).updateState() : null;
  }

  void requestJoin() {
    JoinUser joinUser = JoinUser(
      name: nameController.text,
      loginId: idController.text,
      password: passwordController.text,
      phoneNumber: combinePhoneNumber(),
      nickname: nickNameController.text,
      email: '${emailController.text}@${emailDomainController.text}',
      isAgree: isAgree,
    );
    JoinUserRepository joinUserRepository = JoinUserRepository(Dio());
    joinUserRepository.insert(joinUser).then((value) => null);
  }
}
