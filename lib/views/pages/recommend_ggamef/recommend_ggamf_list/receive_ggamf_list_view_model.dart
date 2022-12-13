import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';

final receiveGgamfListViewModel =
    StateNotifierProvider<ReceiveGgamfListViewModel, List<User>>(
        (ref) => ReceiveGgamfListViewModel([]));

class ReceiveGgamfListViewModel extends StateNotifier<List<User>> {
  ReceiveGgamfListViewModel(super.state);

  //토큰이 필요한 곳 이므로 인터셉터 추가
  RecommendGgamfListRepository repo = RecommendGgamfListRepository(Dio()
    ..interceptors.add(LogInterceptor())
    ..interceptors.add(SignedInterceptor()));

  void init() {
    List<User> receiveGgamfList = [];
    repo.getReceiveggamfList(id: UserSession.user.id).then((value) {
      receiveGgamfList.add(
        User(
          id: value.id,
          backgroundImage: value.backgroundImage,
          name: value.name,
          intro: value.intro ?? '자기소개가 없습니다.',
          username: value.username,
        ),
      );
      state = receiveGgamfList;
    });
  }
}
