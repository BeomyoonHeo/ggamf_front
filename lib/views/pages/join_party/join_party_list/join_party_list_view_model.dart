import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/party/model/room.dart';
import 'package:ggamf_front/domain/party/repository/room_repository.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/utils/validator_util.dart';

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
      value.data.forEach((_Room) {
        logger.d("룸밸류 확인 ${value}");
        joinPartyList.add(
          Room(
            id: _Room.id,
            nickName: _Room.nickName,
            roomName: _Room.roomName,
            gameName: _Room.gameName,
            totalPeople: _Room.totalPeople,
            gameLogo: _Room.gameLogo,
            count: _Room.count,
            uid: _Room.uid,
          ),
        );
        logger.d("데이터확인1 ${_Room.nickName}");
        logger.d("데이터확인2 ${_Room.roomName}");
        logger.d("데이터확인3 ${_Room.gameName}");
        logger.d("데이터확인4 ${_Room.totalPeople}");
        logger.d("데이터확인5 ${_Room.gameLogo}");
        logger.d("데이터확인6 ${_Room.count}");
        logger.d("데이터확인7 ${_Room.uid}");
      });
      state = joinPartyList;
    });
  }

  void findAllRoomByCategory(String category) {
    state = state.where((_Room) => _Room.gameName != category).toList();
    //전체 파티방 목록보기
    RoomRepository restApi = RoomRepository(Dio());
    restApi.findAllRoom(userId: 1).then((value) =>
        value.data.isEmpty ? null : state = value.data as List<Room>);
  }

  void findAllRoomByKeyword(String keyword) {
    state = state.where((_Room) => _Room.roomName != keyword).toList();
    //전체 파티방 목록보기
    RoomRepository restApi = RoomRepository(Dio());
    restApi.findAllRoom(userId: 1).then((value) =>
        value.data.isEmpty ? null : state = value.data as List<Room>);
  }
}
