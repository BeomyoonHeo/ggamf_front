import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/ggamf.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';
import 'package:ggamf_front/views/pages/recommend_ggamef/recommend_ggamf_list/recommend_ggamf_list_view_model.dart';

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
  Map<int, Ggamf> _myGgamIdList = {};
  Map<int, Ggamf> _sendGgamfIdList = {};

  Map<int, Ggamf> get myGgamfIdList => _myGgamIdList;

  Map<int, Ggamf> get sendGgamfIdList => _sendGgamfIdList;

  void addMyGgamf(Ggamf _ggamf) {
    _myGgamIdList[_ggamf.userId] = _ggamf;
    state = [...state, _ggamf];
  }

  void deleteGgamf(int id) {
    state = state.where((_ggamf) {
      if (_ggamf.userId != id) {
        _myGgamIdList.remove(_ggamf.userId);
        return true;
      }
      return false;
    }).toList();
  }

  void requestGgamf(int id) {
    _ref.read(recommendGgamfListViewModel.notifier).deleteRecommendGgamf(id);
  }

  void showMyGgamf() {
    repo.myGgamfList(userId: UserSession.user.id).then(
      (value) {
        if (value.data != null) {
          logger.d('내껨프 벨류 확인 : ${value.data}');
          value.data['friendList']?.forEach((_ggamf) {
            _myGgamIdList[_ggamf.userId] = _ggamf;
            myGgamfList.add(
              Ggamf(
                userId: _ggamf.userId,
                photo: _ggamf.photo,
                nickname: _ggamf.nickname,
                intro: _ggamf.intro,
              ),
            );
          });
        }
        state = myGgamfList;
      },
    );
  }
}
