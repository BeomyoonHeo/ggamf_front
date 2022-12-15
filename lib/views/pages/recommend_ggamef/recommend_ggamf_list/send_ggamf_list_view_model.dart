import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/ggamf.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';

final sendGgamfListViewModel =
    StateNotifierProvider.autoDispose<SendGgamfListViewModel, List<Ggamf>>(
        (ref) => SendGgamfListViewModel([])..init());

class SendGgamfListViewModel extends StateNotifier<List<Ggamf>> {
  SendGgamfListViewModel(super.state);

  //토큰이 필요한 곳 이므로 인터셉터 추가
  RecommendGgamfListRepository repo = RecommendGgamfListRepository(Dio()
    ..interceptors.add(CustomLogInterceptor())
    ..interceptors.add(SignedInterceptor()));
  List<Ggamf> sendGgamfList = [];
  void init() {
    repo.getSendGgamfList(id: UserSession.user.id).then(
      (value) {
        value.data['followings']?.forEach((_ggamf) {
          sendGgamfList.add(
            Ggamf(
              userId: _ggamf.userId,
              photo: _ggamf.photo,
              nickname: _ggamf.nickname,
              intro: _ggamf.intro,
            ),
          );
        });
        state = sendGgamfList;
      },
    );
  }

  cancelSendGgamf(int id) {
    state = state.where((_ggamf) => _ggamf.userId != id).toList();
  }
}
