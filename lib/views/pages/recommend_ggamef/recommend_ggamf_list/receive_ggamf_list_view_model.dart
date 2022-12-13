import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/ggamf.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';

final receiveGgamfListViewModel =
    StateNotifierProvider<ReceiveGgamfListViewModel, List<Ggamf>>(
        (ref) => ReceiveGgamfListViewModel([])..init());

class ReceiveGgamfListViewModel extends StateNotifier<List<Ggamf>> {
  ReceiveGgamfListViewModel(super.state);

  //토큰이 필요한 곳 이므로 인터셉터 추가
  RecommendGgamfListRepository repo = RecommendGgamfListRepository(Dio()
    ..interceptors.add(LogInterceptor())
    ..interceptors.add(SignedInterceptor()));

  void init() {
    List<Ggamf> receiveGgamfList = [];
    repo.getRecommendGgamfList(id: UserSession.user.id).then(
      (value) {
        value.data.forEach((_ggamf) {
          receiveGgamfList.add(
            Ggamf(
              friendId: _ggamf.friendId,
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
}
