import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ggamf_front/core/page_enum.dart';
import 'package:ggamf_front/domain/user/model/login_user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/main.dart';
import 'package:ggamf_front/utils/validator_util.dart';

final userController = Provider((ref) => UserController());

class UserController {
  final userRepository = UserRepository(Dio());
  login(String username, String password) {
    logger.d('username : ${username}');
    logger.d('password : ${password}');
    final loginUser = LoginUser(loginId: username, password: password);
    userRepository.login(loginUser: loginUser).then((value) {
      Navigator.pushNamed(navigatorKey.currentState!.context,
          PageEnum.ALLPAGES.requestLocation);
    }).onError((error, stackTrace) {
      print(error);
      Fluttertoast.showToast(msg: '아이디와 패스워드를 확인해주세요');
    });
  }
}
