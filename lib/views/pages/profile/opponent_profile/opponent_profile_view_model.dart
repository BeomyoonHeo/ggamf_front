import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/profile_user.dart';
import 'package:ggamf_front/domain/user/repository/profile_user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';

final opponentProfileViewModel = StateNotifierProvider<OpponentProfileViewModel, ProfileUser>((ref) {
  return OpponentProfileViewModel(ProfileUser(intro: null, nickname: null, photo: null, password: null), ref)..init();
});

class OpponentProfileViewModel extends StateNotifier<ProfileUser> {
  final Ref _ref;
  OpponentProfileViewModel(super.state, this._ref);

  Dio dio = Dio()..interceptors.add(CustomLogInterceptor());

  void init() {
    ProfileUserRepository restApi = ProfileUserRepository(dio);
    restApi.getUserProfile(id: 1).then((value) => state = ProfileUser(photo: value.photo, nickname: value.nickname, intro: value.intro));
  }

  void showProfile(ProfileUser profileUser) {
    state = profileUser;
  }
}
