import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/party/model/room.dart';
import 'package:ggamf_front/domain/party/repository/room_repository.dart';
import 'package:ggamf_front/domain/user/model/user.dart';

import '../../../../utils/custom_intercepter.dart';

final joinPartyListViewModel =
    StateNotifierProvider.autoDispose<JoinPartyListViewModel, List<Room>>(
        (ref) {
  return JoinPartyListViewModel([])..init();
});

class JoinPartyListViewModel extends StateNotifier<List<Room>> {
  JoinPartyListViewModel(super.state);

  RoomRepository repo = RoomRepository(Dio()
    ..interceptors.add(CustomLogInterceptor())
    ..interceptors.add(SignedInterceptor()));

  List<Room> joinPartyList = [];

  void init() {
    repo.findAllRoom(userId: UserSession.user.id).then((value) {
      value.data['rooms']?.forEach((_Room) {
        joinPartyList.add(
          Room(
            id: _Room.id,
            nickName: _Room.nickName,
            roomName: _Room.roomName,
            gameName: _Room.gameName,
            totalPeople: _Room.totalPeople,
          ),
        );
      });
      state = joinPartyList;
    });
  }

  // void findAllRoomByGameCode(int gameCode) {
  //   state = state.where((_Room) => _Room. != ).toList();
  // }

  void findAllRoomByKeyword(String keyword) {
    state = state.where((_Room) => _Room.gameName != keyword).toList();
    //전체 파티방 목록보기
    RoomRepository restApi = RoomRepository(Dio());
    restApi.findAllRoom(userId: 1).then((value) =>
        value.data.isEmpty ? null : state = value.data as List<Room>);
  }
}
