import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/ggamf/repository/my_ggamf_repository.dart';
import 'package:ggamf_front/domain/party/model/room.dart';
import 'package:ggamf_front/domain/party/repository/room_repository.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/utils/validator_util.dart';

import '../../../../domain/party/model/my_room.dart';
import '../../../../utils/custom_intercepter.dart';

final myRecruitmentPartyListViewModel = StateNotifierProvider.autoDispose<MyRecruitmentPartyListViewModel, List<MyRoom>>((ref) {
  return MyRecruitmentPartyListViewModel([])..init();
});

class MyRecruitmentPartyListViewModel extends StateNotifier<List<MyRoom>> {
  MyRecruitmentPartyListViewModel(super.state);

  RoomRepository repo = RoomRepository(Dio()
    ..interceptors.add(CustomLogInterceptor())
    ..interceptors.add(SignedInterceptor()));

  List<MyRoom> myRecruitmentPartyList = [];

  void init() {
    repo.findByMyIdRoom(userId: UserSession.user.id).then((value) {
      value.data['rooms']?.forEach((_myRoom) {
        myRecruitmentPartyList.add(
          MyRoom(
            id: _myRoom.id,
            nickName: _myRoom.nickName,
            roomName: _myRoom.roomName,
            totalPeople: _myRoom.totalPeople,
            gameLogo: _myRoom.gameLogo,
          ),
        );
      });
      state = myRecruitmentPartyList;
    });
  }

  void updateMyRecruitmentParty() {}
}
