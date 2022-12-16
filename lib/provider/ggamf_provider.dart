import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/ggamf.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';

final ggamfProvider = StateNotifierProvider<GgamfProvider, List<Ggamf>>(
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

  void addMyGgamf() {}

  void showMyGgamf() {
    repo.myGgamfList(userId: UserSession.user.id).then(
      (value) {
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
        state = myGgamfList;
      },
    );
  }
}
