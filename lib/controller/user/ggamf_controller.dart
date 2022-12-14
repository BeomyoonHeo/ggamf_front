import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';
import 'package:ggamf_front/views/pages/recommend_ggamef/recommend_ggamf_list/receive_ggamf_list_view_model.dart';

final ggamfController = Provider((ref) => GgamfController(ref));

class GgamfController {
  final Ref ref;
  GgamfController(this.ref);
  late RecommendGgamfListRepository repo = RecommendGgamfListRepository(Dio()
    ..interceptors.add(CustomLogInterceptor())
    ..interceptors.add(SignedInterceptor()));

  void deleteRecommendGgamf(int id) {}

  void acceptReceiveGgamf(int targetId) {
    repo.acceptReceiveGgmaf(id: UserSession.user.id, targetId: targetId).then(
        (value) =>
            ref.read(receiveGgamfListViewModel.notifier).acceptGgamf(targetId));
  }
}
