import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/profile_user.dart';
import 'package:ggamf_front/domain/user/model/update_user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';
import 'package:ggamf_front/views/pages/profile/my_profile/my_profile_view_model.dart';

final updateMyProfileViewModel = StateNotifierProvider<UpdateMyProfileViewModel, UpdateUser>((ref) {
  return UpdateMyProfileViewModel(UpdateUser(photo: null, nickname: null, intro: null), ref);
});

class UpdateMyProfileViewModel extends StateNotifier<UpdateUser> {
  final Ref _ref;
  UpdateMyProfileViewModel(super.state, this._ref);

  Dio dio = Dio()..interceptors.add(CustomLogInterceptor());

  Future<void> updateMyProfile(UpdateUser updateUser) async {
    ProfileUserRepository restApi = await ProfileUserRepository(dio);
  }
}
