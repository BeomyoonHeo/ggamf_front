import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/ggamf.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/utils/validator_util.dart';

import '../../../../utils/custom_intercepter.dart';

final myGgamfListViewModel = StateNotifierProvider.autoDispose<MyGgamfListViewModel, List<Ggamf>>((ref) {
  return MyGgamfListViewModel([])..init();
});

class MyGgamfListViewModel extends StateNotifier<List<Ggamf>> {
  MyGgamfListViewModel(super.state);

  GgamfRepository repo = GgamfRepository(Dio()
    ..interceptors.add(CustomLogInterceptor())
    ..interceptors.add(SignedInterceptor()));

  List<Ggamf> myGgamfList = [];

  void init() {
    // 최초 init 시에만 repository에 의존
    repo.myGgamfList(userId: UserSession.user.id).then(
      (value) {
        value.data['friendList']?.forEach((_ggamf) {
          myGgamfList.add(
            Ggamf(
              userId: _ggamf.userId,
              photo: _ggamf.photo,
              nickname: _ggamf.nickname,
              intro: _ggamf.intro,
            ),
          );
          // logger.d("데이터 확인1 : ${_ggamf.userId}");
          // logger.d("데이터 확인2 : ${_ggamf.photo}");
          // logger.d("데이터 확인3 : ${_ggamf.nickname}");
          // logger.d("데이터 확인4 : ${_ggamf.intro}");
        });
        state = myGgamfList;
      },
    );
  }

  //메서드로 깊은복사받기
}
