import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/data/data.dart';
import 'package:ggamf_front/data/rest_client.dart';

final recommendGgamfListViewModel =
    StateNotifierProvider<RecommendGgamfListViewModel, List<Data>>((ref) {
  return RecommendGgamfListViewModel([], ref)..init();
});

class RecommendGgamfListViewModel extends StateNotifier<List<Data>> {
  final Ref _ref;
  RecommendGgamfListViewModel(super.state, this._ref);

  //final dio = Dio()..interceptors.add(CustomLogInterceptor());
  void init() {
    RestClient restApi = RestClient(Dio());
    restApi
        .getUser(page: 1)
        .then((value) => value.data.isEmpty ? null : state = value.data);
  }
}
