import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/ggamf.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';

final sendGgamfListViewModel =
    StateNotifierProvider<SendGgamfListViewModel, List<Ggamf>>(
        (ref) => SendGgamfListViewModel([])..init());

class SendGgamfListViewModel extends StateNotifier<List<Ggamf>> {
  SendGgamfListViewModel(super.state);

  //토큰이 필요한 곳 이므로 인터셉터 추가
  RecommendGgamfListRepository repo = RecommendGgamfListRepository(Dio()
    ..interceptors.add(CustomLogInterceptor())
    ..interceptors.add(SignedInterceptor()));

  void init() {
    List<Ggamf> sendGgamfList = [];
    repo.getRecommendGgamfList(id: UserSession.user.id).then(
      (value) {
        value.data.forEach((_ggamf) {
          sendGgamfList.add(
            Ggamf(
              friendId: _ggamf.friendId,
              photo: _ggamf.photo,
              nickName: _ggamf.nickName,
              intro: _ggamf.intro,
            ),
          );
        });
        state = sendGgamfList;
      },
    );
  }
}
