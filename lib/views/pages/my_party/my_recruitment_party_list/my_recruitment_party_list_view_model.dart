import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/party/model/room.dart';
import 'package:ggamf_front/domain/party/repository/room_repository.dart';

final myRecruitmentPartyListViewModel = StateNotifierProvider<MyRecruitmentPartyListViewModel, List<RoomList>>((ref) {
  return MyRecruitmentPartyListViewModel([], ref)..init();
});

class MyRecruitmentPartyListViewModel extends StateNotifier<List<RoomList>> {
  final Ref _ref;
  MyRecruitmentPartyListViewModel(super.state, this._ref);

  //final dio = Dio()..interceptors.add(CustomLogInterceptor());
  void init() {}
}
