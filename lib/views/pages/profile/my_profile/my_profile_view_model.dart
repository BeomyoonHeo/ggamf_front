import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/get_profile_user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';
import 'package:ggamf_front/utils/validator_util.dart';

final myProfileViewModel = StateNotifierProvider<MyProfileViewModel, GetProfileUser>((ref) {
  logger.d("실행댐");
  return MyProfileViewModel(GetProfileUser(intro: null, nickname: null, photo: null), ref)..init();
});

//View의 데이터를 가짐
class MyProfileViewModel extends StateNotifier<GetProfileUser> {
  final Ref _ref;
  MyProfileViewModel(super.state, this._ref);

  Dio dio = Dio()..interceptors.add(CustomLogInterceptor());

  void init() {
    ProfileUserRepository restApi = ProfileUserRepository(dio);
    restApi.getUserProfile(userId: 3).then((value) {
      GetProfileUser? getProfileUser;
      Map<String, dynamic> data = value;
      data.forEach((key, value) => key == 'data' ? getProfileUser = GetProfileUser.fromJson(value) : null);
      state = getProfileUser!;
    });
  }
}
