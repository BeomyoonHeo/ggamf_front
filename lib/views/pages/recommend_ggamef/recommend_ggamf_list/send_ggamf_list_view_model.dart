import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/ggamf.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/provider/ggamf_provider.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';

final sendGgamfListViewModel =
    StateNotifierProvider.autoDispose<SendGgamfListViewModel, List<Ggamf>>(
        (ref) => SendGgamfListViewModel([], ref)..init());

class SendGgamfListViewModel extends StateNotifier<List<Ggamf>> {
  final Ref _ref;
  SendGgamfListViewModel(super.state, this._ref);

  //토큰이 필요한 곳 이므로 인터셉터 추가
  GgamfRepository repo = GgamfRepository(Dio()
    ..interceptors.add(CustomLogInterceptor())
    ..interceptors.add(SignedInterceptor()));
  List<Ggamf> sendGgamfList = [];
  void init() {
    final sendList = _ref.read(ggamfProvider.notifier).sendGgamfIdList;
    repo.getSendGgamfList(id: UserSession.user.id).then(
      (value) {
        value.data['followings']?.forEach((_ggamf) {
          sendList[_ggamf.userId] = _ggamf.userId;
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
