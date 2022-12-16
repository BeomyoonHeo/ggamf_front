import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/views/pages/join_party/join_party_list/join_party_list_view_model.dart';

import '../../domain/party/repository/room_repository.dart';
import '../../domain/user/model/user.dart';
import '../../utils/custom_intercepter.dart';

final joinPartyController = Provider((ref) {
  return JoinPartyController(ref);
});

class JoinPartyController {
  final Ref _ref;

  JoinPartyController(this._ref);

  late RoomRepository repo = RoomRepository(Dio()
    ..interceptors.add(CustomLogInterceptor())
    ..interceptors.add(SignedInterceptor()));

  // //게임코드로 검색해서보기
  // void findAllRoomByGameCode(int userId, int gameCode) {
  //   repo
  //       .findAllRoomByGameCode(userId: UserSession.user.id, gameCode: gameCode)
  //       .then((value) => _ref.read(joinPartyListViewModel.notifier).findAllRoomByGameCode(gameCode));
  // }

  //게임코드로 검색해서보기
  void findAllRoomByKeyword(int userId, String keyword) {
    repo
        .findAllRoomByKeyword(userId: UserSession.user.id, keyword: keyword)
        .then((value) => _ref.read(joinPartyListViewModel.notifier).findAllRoomByKeyword(keyword));
  }
}
