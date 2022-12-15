import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/party/model/room.dart';
import 'package:ggamf_front/domain/party/repository/room_repository.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/utils/validator_util.dart';

import '../../../../utils/custom_intercepter.dart';

final joinPartyListViewModel = StateNotifierProvider.autoDispose<JoinPartyListViewModel, List<Room>>((ref) {
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
        logger.d("룸밸류 확인 ${value}");
        joinPartyList.add(
          Room(
            id: _Room.id,
            nickName: _Room.nickName,
            roomName: _Room.roomName,
            gameLogo: _Room.gameLogo,
            gameName: _Room.gameName,
            active: _Room.active,
          ),
        );
        logger.d("닉네임 : ${_Room.nickName}");
        // logger.d("데이터 확인2 : ${_Room.roomName}");
        // logger.d("데이터 확인3 : ${_Room.totalPeople}");
        // logger.d("데이터 확인4 : ${_Room.gameLogo}");
        // logger.d("데이터 확인5 : ${_Room.id}");
        // logger.d("데이터 확인6 : ${_Room.gameName}");
      });
      state = joinPartyList;
    });
  }
}
