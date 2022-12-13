import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/profile_user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';

import '../../../../domain/user/model/get_profile_user.dart';
import '../../../../utils/validator_util.dart';

final opponentProfileViewModel = StateNotifierProvider<OpponentProfileViewModel, GetProfileUser>((ref) {
  return OpponentProfileViewModel(GetProfileUser(intro: null, nickname: null, photo: null), ref)..init();
});

class OpponentProfileViewModel extends StateNotifier<GetProfileUser> {
  final Ref _ref;
  OpponentProfileViewModel(super.state, this._ref);

  Dio dio = Dio()..interceptors.add(CustomLogInterceptor());

  void init() {
    ProfileUserRepository restApi = ProfileUserRepository(dio);
    restApi.getUserProfile(userId: 1).then((value) {
      GetProfileUser? getProfileUser;
      Map<String, dynamic> data = value;
      data.forEach((key, value) => key == 'data' ? getProfileUser = GetProfileUser.fromJson(value) : null);
      state = getProfileUser!;
    });
  }
}
