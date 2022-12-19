import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/withdraw_user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';

final withdrawalViewModel = StateNotifierProvider<WithdrawalViewModel, WithdrawUser>((ref) {
  return WithdrawalViewModel(WithdrawUser(id: null, state: null), ref);
});

class WithdrawalViewModel extends StateNotifier<WithdrawUser> {
  final Ref _ref;
  WithdrawalViewModel(super.state, this._ref);

  final dio = Dio()
    ..interceptors.add(CustomLogInterceptor())
    ..interceptors.add(SignedInterceptor());

  Future<void> withdrawUser(WithdrawUser withdrawUser) async {
    GgamfRepository ggamfRepository = await GgamfRepository(dio);
  }
}
