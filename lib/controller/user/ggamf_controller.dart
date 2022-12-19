import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/ggamf.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/provider/ggamf_provider.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';
import 'package:ggamf_front/views/pages/profile/withdrawal/withdrawal_view_model.dart';
import 'package:ggamf_front/views/pages/recommend_ggamef/recommend_ggamf_list/receive_ggamf_list_view_model.dart';
import 'package:ggamf_front/views/pages/recommend_ggamef/recommend_ggamf_list/send_ggamf_list_view_model.dart';

import '../../domain/user/model/withdraw_user.dart';

final ggamfController = Provider((ref) => GgamfController(ref));

class GgamfController {
  final Ref ref;
  GgamfController(this.ref);
  late GgamfRepository repo = GgamfRepository(Dio()
    ..interceptors.add(CustomLogInterceptor())
    ..interceptors.add(SignedInterceptor()));

  void deleteRecommendGgamf(int id) {}

  //겜프 요청 수락
  void acceptReceiveGgamf(int targetId) {
    repo
        .acceptReceiveGgmaf(id: UserSession.user.id, targetId: targetId)
        .then((value) => ref.read(receiveGgamfListViewModel.notifier).acceptGgamf(targetId));
  }

  //겜프 요청 무시
  void denyReceiveGgamf(int targetId) {
    repo
        .denyReceiveGgamf(id: UserSession.user.id, targetId: targetId)
        .then((value) => ref.read(receiveGgamfListViewModel.notifier).denyGgamf(targetId));
  }

  //겜프 요청 보낸 것 취소
  void cancelSendGgamf(int targetId) {
    repo
        .cancelSendGgamf(id: UserSession.user.id, targetId: targetId)
        .then((value) => ref.read(sendGgamfListViewModel.notifier).cancelSendGgamf(targetId));
  }

  void requestGgamf(Ggamf ggamf) {
    repo.requestGgmf(id: UserSession.user.id, followUserId: ggamf.userId).then((value) {
      ref.read(sendGgamfListViewModel.notifier).addSendGgamf(ggamf);
      ref.read(ggamfProvider.notifier).requestGgamf(ggamf.userId);
    });
  }

  void deleteGgamf(int friendId) {
    repo.deleteGgamf(userId: UserSession.user.id, friendId: friendId).then((value) {
      ref.read(ggamfProvider.notifier).deleteGgamf(friendId);
    });
  }

  void withdrawUser(String state) {
    WithdrawUser withdrawUser = WithdrawUser(
      id: UserSession.user.id,
      state: state,
    );
    repo.withdraw(userId: UserSession.user.id).then((value) {
      ref.read(withdrawalViewModel.notifier).withdrawUser(withdrawUser);
    });
  }
}
