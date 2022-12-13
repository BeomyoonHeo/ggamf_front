import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';

final recommendGgamfListViewModel =
    StateNotifierProvider<RecommendGgamfListViewModel, List<User>>((ref) {
  return RecommendGgamfListViewModel([], ref)..init();
});

class RecommendGgamfListViewModel extends StateNotifier<List<User>> {
  final Ref _ref;
  RecommendGgamfListViewModel(super.state, this._ref);

  //final dio = Dio()..interceptors.add(CustomLogInterceptor());
  void init() {
    // 최초 init 시에만 repository에 의존
    RecommendGgamfListRepository restApi = RecommendGgamfListRepository(Dio());
    List<User> recommendGgamfList = [];
    restApi.getUserList(id: 1).then(
          (value) => recommendGgamfList.add(
            User(
                userId: value.userId,
                backgroundImage: value.backgroundImage,
                name: value.name,
                intro: value.intro),
          ),
        );
  }
}
