import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/profile_user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';

import '../../../../utils/validator_util.dart';

final opponentProfileViewModel =
    StateNotifierProvider<OpponentProfileViewModel, ProfileUser>((ref) {
  return OpponentProfileViewModel(
      ProfileUser(
          intro: null,
          nickname: null,
          photo: null,
          password: null,
          phone: null,
          email: null),
      ref)
    ..init();
});

class OpponentProfileViewModel extends StateNotifier<ProfileUser> {
  final Ref _ref;
  OpponentProfileViewModel(super.state, this._ref);

  Dio dio = Dio()..interceptors.add(CustomLogInterceptor());

  void init() {
    ProfileUserRepository restApi = ProfileUserRepository(dio);
    restApi.getUserProfile(userId: 3).then((value) {
      ProfileUser? profileUser;
      Map<String, dynamic> data = value;
      data.forEach((key, value) =>
          key == 'data' ? profileUser = ProfileUser.fromJson(value) : null);
      state = profileUser!;
    });
  }

  void showProfile(ProfileUser profileUser) {
    logger.d("로그찍기75");
    state = profileUser;
  }
}
