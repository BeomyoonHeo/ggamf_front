import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/withdraw_user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';

final withdrawalViewModel =
    StateNotifierProvider<WithdrawalViewModel, WithdrawUser>((ref) {
  return WithdrawalViewModel(WithdrawUser(id: null, state: null), ref);
});

class WithdrawalViewModel extends StateNotifier<WithdrawUser> {
  final Ref _ref;
  WithdrawalViewModel(super.state, this._ref);

  Dio dio = Dio()..interceptors.add(CustomLogInterceptor());

  void withdraw(WithdrawUser withdrawUser) {
    ProfileUserRepository restApi = ProfileUserRepository(dio);
    //restApi.withdrawUser(userId: 1, withdrawUser: withdrawUser).then((value) => state = WithdrawUser(id: 1, state: "30일"));
  }
}
