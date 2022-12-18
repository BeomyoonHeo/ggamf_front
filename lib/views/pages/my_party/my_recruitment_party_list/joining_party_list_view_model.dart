import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/party/model/room.dart';
import 'package:ggamf_front/domain/party/repository/room_repository.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/provider/chats_page_provider.dart';

import '../../../../utils/custom_intercepter.dart';

final joiningPartyListViewModel =
    StateNotifierProvider.autoDispose<JoiningPartyListViewModel, List<Room>>(
        (ref) {
  return JoiningPartyListViewModel([], ref)..init();
});

class JoiningPartyListViewModel extends StateNotifier<List<Room>> {
  final Ref _ref;
  JoiningPartyListViewModel(super.state, this._ref);

  RoomRepository repo = RoomRepository(Dio()
    ..interceptors.add(CustomLogInterceptor())
    ..interceptors.add(SignedInterceptor()));

  List<Room> joiningPartyList = [];

  void init() async {
    await _ref.watch(chatsPageProvider.notifier).getChats();
    repo.findJoinRooms(userId: UserSession.user.id).then((value) {
      value.data['rooms']?.forEach((_room) {
        joiningPartyList.add(
          Room(
            id: _room.id,
            nickName: _room.nickName,
            roomName: _room.roomName,
            totalPeople: _room.totalPeople,
            gameName: _room.gameName,
          ),
        );
        // logger.d("데이터 확인1 : ${_myRoom.nickName}");
        // logger.d("데이터 확인2 : ${_myRoom.roomName}");
        // logger.d("데이터 확인3 : ${_myRoom.totalPeople}");
        // logger.d("데이터 확인4 : ${_myRoom.gameLogo}");
        // logger.d("데이터 확인4 : ${_myRoom.id}");
      });
      state = joiningPartyList;
    });
  }

  void updateMyRecruitmentParty() {}
}
