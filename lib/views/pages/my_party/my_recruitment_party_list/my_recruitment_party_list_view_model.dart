import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/ggamf/repository/my_ggamf_repository.dart';
import 'package:ggamf_front/domain/party/model/room.dart';
import 'package:ggamf_front/domain/party/repository/room_repository.dart';

import '../../../../utils/custom_intercepter.dart';

final myRecruitmentPartyListViewModel = StateNotifierProvider.autoDispose<MyRecruitmentPartyListViewModel, RoomList?>((ref) {
  return MyRecruitmentPartyListViewModel(null, ref)..init();
});

class MyRecruitmentPartyListViewModel extends StateNotifier<RoomList?> {
  final Ref _ref;
  MyRecruitmentPartyListViewModel(super.state, this._ref);

  Dio dio = Dio()..interceptors.add(CustomLogInterceptor());

  void init() {
    RoomRepository restApi = RoomRepository(dio);
    restApi.findByMyIdRoom(userId: 1).then((value) {
      RoomList? roomList;
      Map<String, dynamic> data = value;
      data.forEach((key, value) => key == 'data' ? roomList = RoomList.fromJson(value) : null);
      state = roomList!;
    });
  }
}
