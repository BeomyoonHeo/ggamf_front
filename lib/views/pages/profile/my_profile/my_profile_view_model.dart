import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/profile_user.dart';
import 'package:ggamf_front/domain/user/repository/profile_user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';

final myProfileViewModel = StateNotifierProvider<MyProfileViewModel, ProfileUser>((ref) {
  return MyProfileViewModel(
      ProfileUser(
        intro: null,
        nickname: null,
        photo: null,
      ),
      ref)
    ..init();
});

class MyProfileViewModel extends StateNotifier<ProfileUser> {
  final Ref _ref;
  MyProfileViewModel(super.state, this._ref);

  Dio dio = Dio()..interceptors.add(CustomLogInterceptor());

  void init() {
    ProfileUserRepository restApi = ProfileUserRepository(dio);
    restApi.getUserProfile(id: 1).then((value) => state = ProfileUser(photo: value.photo, nickname: value.nickname, intro: value.intro));
  }

  void showProfile(ProfileUser profileUser) {
    state = profileUser;
  }
}
