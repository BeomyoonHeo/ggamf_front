import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ggamf_front/domain/user/model/update_user.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/domain/user/repository/profile_user_repository.dart';
import 'package:ggamf_front/main.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';
import 'package:ggamf_front/views/pages/profile/update_my_profile/update_my_profile_view_model.dart';

import '../../utils/validator_util.dart';

final myProfileController = Provider((ref) {
  return MyProfileController(ref);
});

class MyProfileController {
  final Ref _ref;

  MyProfileController(this._ref);

  final mContext = navigatorKey.currentContext;

  late ProfileUserRepository repo = ProfileUserRepository(Dio()
    ..interceptors.add(CustomLogInterceptor())
    ..interceptors.add(SignedInterceptor()));

  final nicknameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final introduceController = TextEditingController();
  final List<TextEditingController> phoneNumberController = [TextEditingController(), TextEditingController(), TextEditingController()];

  String combinePhoneNumber() {
    // 비지니스 로직
    String phoneNumber = '';
    phoneNumberController.forEach((_controller) {
      phoneNumber += '${_controller.text} ';
    });

    phoneNumber = phoneNumber.trim();
    return phoneNumber;
  }

  void updateMyProfile() {
    UpdateUser updateUser = UpdateUser(
      nickname: nicknameController.text,
      intro: introduceController.text,
      email: emailController.text,
      password: passwordController.text,
      phone: combinePhoneNumber(),
    );

    repo.putUserProfile(userId: UserSession.user.id, updateUser: updateUser).then((value) {
      _ref.read(updateMyProfileViewModel.notifier);
      Navigator.pop(mContext!);
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: '입력양식이 맞지 않습니다.');
    });
  }
  // void findById(int id) async {
  //   logger.d("로그찍기5");
  //   ProfileUser profileUser = await repo.getUserProfile(userId: 3);
  // }
}
