import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/ggamf.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/provider/ggamf_provider.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';

final receiveGgamfListViewModel =
    StateNotifierProvider.autoDispose<ReceiveGgamfListViewModel, List<Ggamf>>(
        (ref) => ReceiveGgamfListViewModel([], ref)..init());

class ReceiveGgamfListViewModel extends StateNotifier<List<Ggamf>> {
  final Ref _ref;
  ReceiveGgamfListViewModel(super.state, this._ref);

  //토큰이 필요한 곳 이므로 인터셉터 추가
  GgamfRepository repo = GgamfRepository(Dio()
    ..interceptors.add(CustomLogInterceptor())
    ..interceptors.add(SignedInterceptor()));

  List<Ggamf> receiveGgamfList = [];

  void init() {
    repo.getReceiveggamfList(id: UserSession.user.id).then(
      (value) {
        value.data['followers']?.forEach((_ggamf) {
          receiveGgamfList.add(
            Ggamf(
              userId: _ggamf.userId,
              photo: _ggamf.photo,
              nickname: _ggamf.nickname,
              intro: _ggamf.intro,
            ),
          );
        });
        state = receiveGgamfList;
      },
    );
  }

  //요청 수락 후 껨프요청 리스트 변경 해주기
  void acceptGgamf(int id) {
    state = state.where((_ggamf) {
      if (_ggamf.userId != id) {
        return true;
      }
      _ref.read(ggamfProvider.notifier).addMyGgamf(_ggamf);
      return false;
    }).toList();
  }

  void denyGgamf(int id) {
    state = state.where((_ggamf) => _ggamf.userId != id).toList();
  }
}
