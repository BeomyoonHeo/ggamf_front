import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/ggamf/repository/my_ggamf_repository.dart';
import 'package:ggamf_front/domain/user/model/ggamf.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/utils/validator_util.dart';

import '../../../../utils/custom_intercepter.dart';

final myGgamfListViewModel = StateNotifierProvider.autoDispose<MyGgamfListViewModel, List<Ggamf>>((ref) {
  return MyGgamfListViewModel([])..init();
});

class MyGgamfListViewModel extends StateNotifier<List<Ggamf>> {
  MyGgamfListViewModel(super.state);

  MyGgamfRepository repo = MyGgamfRepository(Dio()
    ..interceptors.add(CustomLogInterceptor())
    ..interceptors.add(SignedInterceptor()));

  List<Ggamf> myGgamfList = [];

  void init() {
    // 최초 init 시에만 repository에 의존

    logger.d("유저 id 확인 : ${UserSession.user.id}");

    repo.myGgamfList(userId: UserSession.user.id).then(
      (value) {
        print("${value}");
        logger.d("밸류 확인 : ${value}");
        value.data['followers']?.forEach((_ggamf) {
          myGgamfList.add(
            Ggamf(
              userId: _ggamf.userId,
              photo: _ggamf.photo,
              nickName: _ggamf.nickName,
              intro: _ggamf.intro,
            ),
          );
          logger.d("데이터 확인1 : ${_ggamf.userId}");
          logger.d("데이터 확인2 : ${_ggamf.photo}");
          logger.d("데이터 확인3 : ${_ggamf.nickName}");
          logger.d("데이터 확인4 : ${_ggamf.intro}");
        });
        state = myGgamfList;
      },
    );
  }

  //메서드로 깊은복사받기
}
