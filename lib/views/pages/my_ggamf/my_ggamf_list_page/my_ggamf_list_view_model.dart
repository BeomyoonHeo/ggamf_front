import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/ggamf.dart';

final myGgamfListViewModel =
    StateNotifierProvider<MyGgamfListViewModel, List<Ggamf>>((ref) {
  return MyGgamfListViewModel([], ref)..init();
});

class MyGgamfListViewModel extends StateNotifier<List<Ggamf>> {
  final Ref _ref;
  MyGgamfListViewModel(super.state, this._ref);

  //final dio = Dio()..interceptors.add(CustomLogInterceptor());
  void init() {} // MyGgamfRepository restApi = MyGgamfRepository(Dio());
// restApi.myGgamf(userId: 1).then((value) => value.myGgamfList.isEmpty ? null : state = value.myGgamfList);
}
