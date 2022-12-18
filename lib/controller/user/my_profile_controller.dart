import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/profile_user.dart';
import 'package:ggamf_front/domain/user/repository/profile_user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';

import '../../utils/validator_util.dart';

final myProfileController = Provider((ref) {
  return MyProfileController(ref);
});

class MyProfileController {
  final Ref _ref;

  MyProfileController(this._ref);

  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController introduceController = TextEditingController();

  late ProfileUserRepository repo = ProfileUserRepository(Dio()
    ..interceptors.add(CustomLogInterceptor())
    ..interceptors.add(SignedInterceptor()));

  void updateMyProfile(int id) async {
    ProfileUser profileUser = ProfileUser(
      nickname: nicknameController.text,
      intro: introduceController.text,
    );
    // ProfileUser profileUser = await repo.getUserProfile(userId: 3);
  }
}
