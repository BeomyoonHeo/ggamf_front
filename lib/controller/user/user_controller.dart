import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ggamf_front/domain/user/model/login_user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/main.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';
import 'package:ggamf_front/utils/page_enum.dart';
import 'package:ggamf_front/utils/validator_util.dart';
import 'package:ggamf_front/views/pages/profile/withdrawal/withdrawal_view_model.dart';

import '../../domain/user/model/user.dart';
import '../../domain/user/model/withdraw_user.dart';

final userController = Provider((ref) => UserController(ref));

class UserController {
  final Ref _ref;

  UserController(this._ref);

  final userRepository = UserRepository(Dio()..interceptors.add(LoginInterceptor()));
  login(String username, String password) async {
    final loginUser = LoginUser(loginId: username, password: password);
    try {
      userRepository.login(loginUser: loginUser).then((value) {
        Map<String, dynamic> response = value;
        logger.d('response 확인 : ${response}');
        Session().getInitSession().then(
              (value) => Navigator.pushNamed(navigatorKey.currentState!.context, PageEnum.ALLPAGES.requestLocation),
            );
      }).onError((error, stackTrace) {
        logger.d(error);
        Fluttertoast.showToast(msg: '아이디와 패스워드를 확인해주세요');
      });
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.code);
      return null;
    }
  }

  void withdrawUser(String state) {
    final repo = UserRepository(Dio()
      ..interceptors.add(CustomLogInterceptor())
      ..interceptors.add(SignedInterceptor()));
    WithdrawUser withdrawUser = WithdrawUser(
      state: state,
    );
    repo.withdraw(userId: UserSession.user.id, withdrawUser: withdrawUser).then((value) async {
      await UserSession.removeAuthentication();
      Navigator.popAndPushNamed(navigatorKey.currentState!.context, PageEnum.LOGIN.requestLocation);
    });
  }
}
