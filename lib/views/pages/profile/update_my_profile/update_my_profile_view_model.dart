import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/profile_user.dart';
import 'package:ggamf_front/domain/user/model/update_user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';

final updateMyProfileViewModel = StateNotifierProvider<UpdateMyProfileViewModel, ProfileUser>((ref) {
  return UpdateMyProfileViewModel(ProfileUser(intro: null, nickname: null, photo: null), ref);
});

class UpdateMyProfileViewModel extends StateNotifier<ProfileUser> {
  final Ref _ref;
  UpdateMyProfileViewModel(super.state, this._ref);

  Dio dio = Dio()..interceptors.add(CustomLogInterceptor());

  // void init() {
  //   ProfileUserRepository restApi = ProfileUserRepository(dio);
  //   restApi.getUserProfile(userId: 1).then((value) => state = ProfileUser(photo: value.photo, nickname: value.nickname, intro: value.intro));
  // }

  void updateMyProfile(UpdateUser updateUser) {
    ProfileUserRepository restApi = ProfileUserRepository(dio);
    restApi
        .putUserProfile(userId: 1, updateUser: updateUser)
        .then((value) => state = ProfileUser(photo: value.photo, nickname: value.nickname, intro: value.intro));
  }

  void showProfile(ProfileUser profileUser) {
    state = profileUser;
  }
}
