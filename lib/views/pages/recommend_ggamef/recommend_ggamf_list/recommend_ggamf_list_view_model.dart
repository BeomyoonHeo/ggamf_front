import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/recommend_ggamf_list/model/recommend_ggamf_list.dart';
import 'package:ggamf_front/domain/recommend_ggamf_list/repository/recommend_ggamf_list_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';

final recommendGgamfListViewModel =
    StateNotifierProvider<RecommendGgamfListViewModel, List<RecommendGgamf>>(
        (ref) {
  return RecommendGgamfListViewModel([], ref)..init();
});

class RecommendGgamfListViewModel extends StateNotifier<List<RecommendGgamf>> {
  final Ref _ref;
  RecommendGgamfListViewModel(super.state, this._ref);

  //final dio = Dio()..interceptors.add(CustomLogInterceptor());
  void init() {
    // 최초 init 시에만 repository에 의존
    Dio dio = Dio()..interceptors.add(CustomLogInterceptor());
    RecommendGgamfListRepository restApi = RecommendGgamfListRepository(dio);
    restApi
        .getUser(page: 1)
        .then((value) => value.data.isEmpty ? null : state = value.data);
  }
}
