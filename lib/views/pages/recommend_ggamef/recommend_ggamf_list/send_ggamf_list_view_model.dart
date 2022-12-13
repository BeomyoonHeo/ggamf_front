import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';

final sendGgamfListViewModel =
    StateNotifierProvider<SendGgamfListViewModel, List<User>>(
        (ref) => SendGgamfListViewModel([]));

class SendGgamfListViewModel extends StateNotifier<List<User>> {
  SendGgamfListViewModel(super.state);

  //토큰이 필요한 곳 이므로 인터셉터 추가
  RecommendGgamfListRepository repo = RecommendGgamfListRepository(Dio()
    ..interceptors.add(LogInterceptor())
    ..interceptors.add(SignedInterceptor()));

  void init() {
    List<User> sendGgamfList = [];
    repo.getSendGgamfList(id: UserSession.user.id).then((value) {
      sendGgamfList.add(
        User(
          id: value.id,
          backgroundImage: value.backgroundImage,
          name: value.name,
          intro: value.intro ?? '자기소개가 없습니다.',
          username: value.username,
        ),
      );
      state = sendGgamfList;
    });
  }
}
