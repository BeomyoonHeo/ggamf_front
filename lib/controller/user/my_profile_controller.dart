import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';

final myProfileController = Provider((ref) {
  return MyProfileController(ref);
});

class MyProfileController {
  final Ref _ref;

  MyProfileController(this._ref);

  final repo =
      ProfileUserRepository(Dio()..interceptors.add(CustomLogInterceptor()));
  // void findById(int id) async {
  //   logger.d("로그찍기5");
  //   ProfileUser profileUser = await repo.getUserProfile(userId: 3);
  // }
}
