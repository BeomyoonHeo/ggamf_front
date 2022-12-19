import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/profile_user.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';

import '../../../../utils/validator_util.dart';

final myProfileViewModel = StateNotifierProvider.autoDispose<MyProfileViewModel, ProfileUser>((ref) {
  return MyProfileViewModel(ProfileUser(intro: null, nickname: null, photo: null), ref)..init();
});

//View의 데이터를 가짐
class MyProfileViewModel extends StateNotifier<ProfileUser> {
  final Ref _ref;
  MyProfileViewModel(super.state, this._ref);

  Dio dio = Dio()
    ..interceptors.add(CustomLogInterceptor())
    ..interceptors.add(SignedInterceptor());

  void init() {
    ProfileUserRepository restApi = ProfileUserRepository(dio);
    restApi.getUserProfile(userId: UserSession.user.id).then((value) {
      ProfileUser? profileUser;
      logger.d("내프로필 밸류확인 : ${value}");
      Map<String, dynamic> data = value;
      data.forEach((key, value) => key == 'data' ? profileUser = ProfileUser.fromJson(value) : '');
      state = profileUser!;
    });
  }

  void updateInit() {}
}
