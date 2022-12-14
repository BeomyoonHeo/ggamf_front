import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/ggamf.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';

final receiveGgamfListViewModel =
    StateNotifierProvider.autoDispose<ReceiveGgamfListViewModel, List<Ggamf>>(
        (ref) => ReceiveGgamfListViewModel([], ref)..init());

class ReceiveGgamfListViewModel extends StateNotifier<List<Ggamf>> {
  final Ref _ref;
  ReceiveGgamfListViewModel(super.state, this._ref);

  //토큰이 필요한 곳 이므로 인터셉터 추가
  RecommendGgamfListRepository repo = RecommendGgamfListRepository(Dio()
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
              nickName: _ggamf.nickName,
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
        // 여기다가 ref 땡겨서 내 껨프 ViewModel에 전달
        //_ref.read(myGgamfListViewModel.notifier).해당메서드(_ggamf);
        return true;
      }
      return false;
    }).toList();
  }

  void denyGgamf(int id) {
    state = state.where((_ggamf) => _ggamf.userId != id).toList();
  }
}
