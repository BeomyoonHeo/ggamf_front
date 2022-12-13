import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';

final recommendGgamfListViewModel =
    StateNotifierProvider<RecommendGgamfListViewModel, List<User>>((ref) {
  return RecommendGgamfListViewModel([], ref)..init();
});

class RecommendGgamfListViewModel extends StateNotifier<List<User>> {
  final Ref _ref;
  RecommendGgamfListViewModel(super.state, this._ref);

  final dio = Dio()
    ..interceptors.add(CustomLogInterceptor())
    ..interceptors.add(SignedInterceptor());
  void init() {
    // 최초 init 시에만 repository에 의존
    RecommendGgamfListRepository repo = RecommendGgamfListRepository(dio);
    List<User> recommendGgamfList = [];
    repo.getRecommendGgamfList(id: UserSession.user.id).then(
      (value) {
        recommendGgamfList.add(
          User(
            id: value.id,
            backgroundImage: value.backgroundImage,
            name: value.name,
            intro: value.intro ?? '자기소개가 없습니다.',
            username: value.username,
          ),
        );
        state = recommendGgamfList;
      },
    );
  }
}
