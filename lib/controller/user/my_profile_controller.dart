import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/profile_user.dart';
import 'package:ggamf_front/domain/user/repository/profile_user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';

final myProfileController = Provider((ref) {
  return MyProfileController(ref);
});

class MyProfileController {
  final Ref _ref;

  MyProfileController(this._ref);

  final repo = ProfileUserRepository(Dio()..interceptors.add(CustomLogInterceptor()));

  void findById(int id) async {
    ProfileUser userdata = await repo.getUserProfile(id: 1);
  }

  void updateById(int id, ProfileUser profileUser) async {
    ProfileUser userdata = await repo.putUserProfile(id: 1, profileUser: profileUser);
  }
}