import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/profile_user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';

final opponentProfileController = Provider((ref) {
  return OpponentProfileController(ref);
});

class OpponentProfileController {
  final Ref _ref;

  OpponentProfileController(this._ref);

  final repo =
      ProfileUserRepository(Dio()..interceptors.add(CustomLogInterceptor()));

  void findById(int id) async {
    ProfileUser userdata = await repo.getUserProfile(id: 1);
  }
}
