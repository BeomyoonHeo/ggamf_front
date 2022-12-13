import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/profile_user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';
import 'package:ggamf_front/utils/validator_util.dart';

final myProfileViewModel = StateNotifierProvider<MyProfileViewModel, ProfileUser>((ref) {
  logger.d("실행댐");
  return MyProfileViewModel(ProfileUser(intro: null, nickname: null, photo: null), ref)..init();
});

//View의 데이터를 가짐
class MyProfileViewModel extends StateNotifier<ProfileUser> {
  final Ref _ref;
  MyProfileViewModel(super.state, this._ref);

  Dio dio = Dio()..interceptors.add(CustomLogInterceptor());

  void init() {
    ProfileUserRepository restApi = ProfileUserRepository(dio);
    logger.d("로그찍기99");
    restApi.getUserProfile(userId: 3).then((value) => state = ProfileUser(photo: value.photo, nickname: value.nickname, intro: value.intro));
  }

  void updateState(ProfileUser profileUser) {
    logger.d("로그찍기3");
    state = profileUser;
  }
}
