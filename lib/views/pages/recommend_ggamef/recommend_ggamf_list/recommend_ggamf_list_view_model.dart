import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/ggamf.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';
import 'package:ggamf_front/utils/validator_util.dart';

final recommendGgamfListViewModel = StateNotifierProvider.autoDispose<RecommendGgamfListViewModel, List<Ggamf>>((ref) {
  return RecommendGgamfListViewModel([], ref)..init();
});

class RecommendGgamfListViewModel extends StateNotifier<List<Ggamf>> {
  final Ref _ref;
  RecommendGgamfListViewModel(super.state, this._ref);

  final dio = Dio()
    ..interceptors.add(CustomLogInterceptor())
    ..interceptors.add(SignedInterceptor());

  List<Ggamf> recommendGgamfList = [];

  void init() {
    // 최초 init 시에만 repository에 의존
    GgamfRepository repo = GgamfRepository(dio);
    logger.d(UserSession.user.id);
    repo.getRecommendGgamfList(id: UserSession.user.id).then(
      (value) {
        if (value != null) {
          value.data['recommendUserList']?.forEach((_ggamf) {
            recommendGgamfList.add(
              Ggamf(
                userId: _ggamf.userId,
                photo: _ggamf.photo,
                nickname: _ggamf.nickname,
                intro: _ggamf.intro,
              ),
            );
          });
        }
        state = recommendGgamfList;
      },
    );
  }

  void deleteRecommendGgamf(int id) {
    state = state.where((_ggamf) => _ggamf.userId != id).toList();
  }
}
