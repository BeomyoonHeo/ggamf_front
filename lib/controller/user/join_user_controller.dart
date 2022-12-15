import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ggamf_front/domain/user/model/join_user.dart';
import 'package:ggamf_front/main.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';
import 'package:ggamf_front/utils/page_enum.dart';
import 'package:ggamf_front/views/pages/join_user/join_user_view_model.dart';
import 'package:logger/logger.dart';

import '../../domain/user/repository/user_repository.dart';
import '../../provider/authentication_provider.dart';

// 회원가입은 한번만 하면 되기 때문에 회원가입 후 Autodispose를 실행하여 페이지에서 참조가 더이상 일어나지 않는다면 메모리에서 제거 해주기
final joinUserController = Provider((ref) {
  return JoinUserController(ref);
});

class JoinUserController {
  var logger = Logger(
    printer: PrettyPrinter(),
  );
  final _ref;
  final dio = Dio()..interceptors.add(CustomLogInterceptor());
  JoinUserController(this._ref);

  bool authOk = false;
  bool isAgree = false;
  String uid = '';
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

  void changeIsAgree() {
    isAgree = !isAgree;
    _ref.read(joinUserViewModel.notifier).updateState();
  }

  void checkAuth() {
    authOk ? _ref.read(joinUserViewModel.notifier).updateState() : null;
  }

  void requestJoin() {
    JoinUser joinUser = JoinUser(
      name: nameController.text,
      loginId: idController.text,
      password: passwordController.text,
      uid: uid,
      phoneNumber: combinePhoneNumber(),
      nickname: nickNameController.text,
      email: '${emailController.text}@${emailDomainController.text}',
      isAgree: isAgree,
    );
    UserRepository joinUserRepository =
        UserRepository(Dio()..interceptors.add(LogInterceptor()));
    try {
      AuthenticationProvider()
          .registerUserUsingEmailAndPassword(joinUser.email, joinUser.password)
          .then((value) {
        logger.d('uid 확인${value}');
        joinUser.uid = value!;
        joinUserRepository.insert(joinUser: joinUser).then((value) =>
            Navigator.popAndPushNamed(navigatorKey.currentState!.context,
                PageEnum.LOGIN.requestLocation));
      });
    } on FirebaseException catch (e) {
      Fluttertoast.showToast(msg: '이메일 중복 발생! 또는 이메일 양식이 올바르지 않아요!');
      logger.d(e);
    } catch (e) {
      Fluttertoast.showToast(msg: '서버 에러 발생! 양식을 올바르게 기입해주세요!');
      logger.d(e);
    }
    joinUserRepository.insert(joinUser: joinUser).then((value) =>
        Navigator.popAndPushNamed(navigatorKey.currentState!.context,
            PageEnum.LOGIN.requestLocation));
  }
}
