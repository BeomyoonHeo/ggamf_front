import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/ggamf.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';

import '../utils/validator_util.dart';

final ggamfProvider =
    StateNotifierProvider.autoDispose<GgamfProvider, List<Ggamf>>(
        (ref) => GgamfProvider([], ref)..showMyGgamf());

class GgamfProvider extends StateNotifier<List<Ggamf>> {
  final Ref _ref;
  GgamfProvider(super.state, this._ref);
  GgamfRepository repo = GgamfRepository(Dio()
    ..interceptors.add(CustomLogInterceptor())
    ..interceptors.add(SignedInterceptor()));

  List<Ggamf> myGgamfList = [];
  Map<int, Ggamf> myGgamIdList = {};
  Map<int, Ggamf> sendGgamfIdList = {};

  void addMyGgamf(Ggamf _ggamf) {
    state = [...state, _ggamf];
  }

  void showMyGgamf() {
    repo.myGgamfList(userId: UserSession.user.id).then(
      (value) {
        logger.d('내껨프 벨류 확인 : ${value.data}');
        value.data['followers']?.forEach((_ggamf) {
          myGgamIdList[_ggamf.userId] = _ggamf;
          myGgamfList.add(
            Ggamf(
              userId: _ggamf.userId,
              photo: _ggamf.photo,
              nickname: _ggamf.nickname,
              intro: _ggamf.intro,
            ),
          );
        });
        value.data['followings']?.forEach((_ggamf) {
          myGgamIdList[_ggamf.userId] = _ggamf;
          myGgamfList.add(
            Ggamf(
              userId: _ggamf.userId,
              photo: _ggamf.photo,
              nickname: _ggamf.nickname,
              intro: _ggamf.intro,
            ),
          );
        });
        state = myGgamfList;
      },
    );
  }
}
