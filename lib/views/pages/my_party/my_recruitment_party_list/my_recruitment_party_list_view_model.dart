import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/ggamf/repository/my_ggamf_repository.dart';
import 'package:ggamf_front/domain/party/model/room.dart';
import 'package:ggamf_front/domain/party/repository/room_repository.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/utils/validator_util.dart';

import '../../../../utils/custom_intercepter.dart';

final myRecruitmentPartyListViewModel = StateNotifierProvider.autoDispose<MyRecruitmentPartyListViewModel, List<Room>>((ref) {
  return MyRecruitmentPartyListViewModel([], ref)..init();
});

class MyRecruitmentPartyListViewModel extends StateNotifier<List<Room>> {
  final Ref _ref;
  MyRecruitmentPartyListViewModel(super.state, this._ref);

  RoomRepository repo = RoomRepository(Dio()
    ..interceptors.add(CustomLogInterceptor())
    ..interceptors.add(SignedInterceptor()));

  List<Room> myRecruitmentPartyList = [];

  void init() {
    logger.d("여깃나");
    repo.findByMyIdRoom(userId: UserSession.user.id).then((value) {
      value.data['rooms']?.forEach((_room) {
        logger.d("룸밸류 확인 ${value}");
        myRecruitmentPartyList.add(Room(
          id: _room.id,
          gameName: _room.gameName,
          roomName: _room.roomName,
          totalPeople: _room.totalPeople,
          active: _room.active,
        ));
      });
    });
  }

  void updateMyRecruitmentParty() {}
}
