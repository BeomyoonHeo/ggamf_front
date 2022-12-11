import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/profile_user.dart';
import 'package:ggamf_front/domain/user/repository/profile_user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';

final updateMyProfileViewModel = StateNotifierProvider<UpdateMyProfileViewModel, ProfileUser>((ref) {
  return UpdateMyProfileViewModel(
      ProfileUser(
        intro: null,
        nickname: null,
        photo: null,
        password: null,
        email: null,
      ),
      ref)
    ..init();
});

class UpdateMyProfileViewModel extends StateNotifier<ProfileUser> {
  final Ref _ref;
  UpdateMyProfileViewModel(super.state, this._ref);

  Dio dio = Dio()..interceptors.add(CustomLogInterceptor());

  void init() {
    ProfileUserRepository restApi = ProfileUserRepository(dio);
    restApi.getUserProfile(id: 1).then((value) => state = ProfileUser(photo: value.photo, nickname: value.nickname, intro: value.intro));
  }

  void updateMyProfile(ProfileUser profileUser) {
    ProfileUserRepository restApi = ProfileUserRepository(dio);
    restApi
        .putUserProfile(id: 1, profileUser: profileUser)
        .then((value) => state = ProfileUser(photo: value.photo, nickname: value.nickname, intro: value.intro));
  }

  void showProfile(ProfileUser profileUser) {
    state = profileUser;
  }
}
