import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/ggamf.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';
import 'package:ggamf_front/utils/validator_util.dart';

final recommendGgamfListViewModel =
    StateNotifierProvider.autoDispose<RecommendGgamfListViewModel, List<Ggamf>>(
        (ref) {
  return RecommendGgamfListViewModel([], ref)..init();
});

class RecommendGgamfListViewModel extends StateNotifier<List<Ggamf>> {
  final Ref _ref;
  RecommendGgamfListViewModel(super.state, this._ref);

  final dio = Dio()
    ..interceptors.add(CustomLogInterceptor())
    ..interceptors.add(SignedInterceptor());
  void init() {
    // 최초 init 시에만 repository에 의존
    RecommendGgamfListRepository repo = RecommendGgamfListRepository(dio);
    List<Ggamf> recommendGgamfList = [];
    logger.d(UserSession.user.id);
    repo.getRecommendGgamfList(id: UserSession.user.id).then(
      (value) {
        value.data.forEach((_ggamf) {
          recommendGgamfList.add(
            Ggamf(
              friendId: _ggamf.friendId,
              photo: _ggamf.photo,
              nickName: _ggamf.nickName,
              intro: _ggamf.intro,
            ),
          );
        });
        state = recommendGgamfList;
      },
    );
  }
}
