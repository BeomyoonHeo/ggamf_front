import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/ggamf.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';
import 'package:ggamf_front/utils/validator_util.dart';

final ggamfProvider = StateNotifierProvider<GgamfProvider, List<Ggamf>>(
    (ref) => GgamfProvider([], ref)..showMyGgamf());

class GgamfProvider extends StateNotifier<List<Ggamf>> {
  final Ref _ref;
  GgamfProvider(super.state, this._ref);
  GgamfRepository repo = GgamfRepository(Dio()
    ..interceptors.add(CustomLogInterceptor())
    ..interceptors.add(SignedInterceptor()));

  List<Ggamf> myGgamfList = [];
  Map<int, int> myGgamIdList = {};
  Map<int, int> sendGgamfIdList = {};

  void showMyGgamf() {
    repo.myGgamfList(userId: UserSession.user.id).then(
      (value) {
        value.data['followers']?.forEach((_ggamf) {
          myGgamIdList[_ggamf.userId] = _ggamf.userId;
          myGgamfList.add(
            Ggamf(
              userId: _ggamf.userId,
              photo: _ggamf.photo,
              nickname: _ggamf.nickname,
              intro: _ggamf.intro,
            ),
          );
        });
        logger.d('내 껨프 리스트 아이디 : ${myGgamIdList}');
        logger.d('보낸 껨프 리스트 아이디 : ${sendGgamfIdList}');
        state = myGgamfList;
      },
    );
  }
}
