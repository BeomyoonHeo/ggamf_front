import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/ggamf/model/my_ggamf.dart';
import 'package:ggamf_front/domain/ggamf/repository/my_ggamf_repository.dart';

final myGgamfListViewModel = StateNotifierProvider<MyGgamfListViewModel, List<MyGgamf>>((ref) {
  return MyGgamfListViewModel([], ref)..init();
});

class MyGgamfListViewModel extends StateNotifier<List<MyGgamf>> {
  final Ref _ref;
  MyGgamfListViewModel(super.state, this._ref);

  //final dio = Dio()..interceptors.add(CustomLogInterceptor());
  void init() {
    MyGgamfRepository restApi = MyGgamfRepository(Dio());
    restApi.myGgamf(userId: 1).then((value) => value.myGgamfList.isEmpty ? null : state = value.myGgamfList);
  }
}
