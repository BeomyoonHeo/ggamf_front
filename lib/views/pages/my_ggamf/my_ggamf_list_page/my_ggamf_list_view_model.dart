import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/ggamf/model/my_ggamf.dart';
import 'package:ggamf_front/domain/ggamf/repository/my_ggamf_repository.dart';
import 'package:ggamf_front/utils/validator_util.dart';

import '../../../../utils/custom_intercepter.dart';

// class MyGgamfModel {
//   List<MyGgamf> ggamfList;
//
//   MyGgamfModel(this.ggamfList);
// }

final myGgamfListViewModel = StateNotifierProvider<MyGgamfListViewModel, MyGgamfList?>((ref) {
  return MyGgamfListViewModel(null, ref)..init();
});

class MyGgamfListViewModel extends StateNotifier<MyGgamfList?> {
  final Ref _ref;
  MyGgamfListViewModel(super.state, this._ref);

  Dio dio = Dio()..interceptors.add(CustomLogInterceptor());

  void init() {
    MyGgamfRepository restApi = MyGgamfRepository(dio);
    restApi.myGgamf(userId: 1).then((value) {
      MyGgamfList? myGgamfList;
      Map<String, dynamic> data = value;
      logger.d(data);
      data.forEach((key, value) => key == 'data' ? myGgamfList = MyGgamfList.fromJson(value) : null);
      state = myGgamfList!;
    });
  }
}
