import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ggamf_front/domain/user/model/login_user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/main.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';
import 'package:ggamf_front/utils/page_enum.dart';
import 'package:ggamf_front/utils/validator_util.dart';

final userController = Provider((ref) => UserController());

class UserController {
  final userRepository = UserRepository(Dio()..interceptors.add(LoginInterceptor()));
  login(String username, String password) async {
    final loginUser = LoginUser(loginId: username, password: password);
    userRepository.login(loginUser: loginUser).then((value) {
      Map<String, dynamic> response = value;
      logger.d(response);
      Session().getInitSession().then(
            (value) => Navigator.pushNamed(navigatorKey.currentState!.context, PageEnum.ALLPAGES.requestLocation),
          );
    }).onError((error, stackTrace) {
      logger.d(error);
      Fluttertoast.showToast(msg: '아이디와 패스워드를 확인해주세요');
    });
  }
}
