import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/party/model/generate_room_party.dart';
import 'package:ggamf_front/domain/party/model/room.dart';
import 'package:ggamf_front/domain/party/repository/room_repository.dart';
import 'package:ggamf_front/domain/user/model/user.dart';

import '../../../../utils/custom_intercepter.dart';

final myRecruitmentPartyListViewModel = StateNotifierProvider.autoDispose<
    MyRecruitmentPartyListViewModel, List<Room>>((ref) {
  return MyRecruitmentPartyListViewModel([])..init();
});

class MyRecruitmentPartyListViewModel extends StateNotifier<List<Room>> {
  MyRecruitmentPartyListViewModel(super.state);
  RoomRepository repo = RoomRepository(Dio()
    ..interceptors.add(CustomLogInterceptor())
    ..interceptors.add(SignedInterceptor()));

  List<Room> myRecruitmentPartyList = [];

  void init() {
    repo.findByMyIdRoom(userId: UserSession.user.id).then((value) {
      value.data['rooms']?.forEach((_room) {
        myRecruitmentPartyList.add(
          Room(
              id: _room.id,
              gameName: _room.gameName,
              nickName: _room.nickName,
              roomName: _room.roomName,
              totalPeople: _room.totalPeople ?? 0),
        );
      });
      state = myRecruitmentPartyList;
    });
  }

  void _reinit() {
    repo.findByMyIdRoom(userId: UserSession.user.id).then((value) {
      List<Room> newMyRecruitmentPartyList = [];
      value.data['rooms']?.forEach((_room) {
        newMyRecruitmentPartyList.add(
          Room(
            id: _room.id,
            nickName: _room.nickName,
            roomName: _room.roomName,
            totalPeople: _room.totalPeople,
            gameName: _room.gameName,
          ),
        );
      });
      state = newMyRecruitmentPartyList;
    });
  }

  void updateMyRecruitmentParty(GenerateRoomParty _party) {
    _reinit();
    //state = [...state, _party.createdParty()];
  }
}
