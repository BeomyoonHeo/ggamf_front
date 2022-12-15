import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/party/model/room.dart';
import 'package:ggamf_front/domain/party/repository/room_repository.dart';

final joinPartyListViewModel = StateNotifierProvider.autoDispose<JoinPartyListViewModel, List<Room>>((ref) {
  return JoinPartyListViewModel([], ref)..init();
});

class JoinPartyListViewModel extends StateNotifier<List<Room>> {
  final Ref _ref;
  JoinPartyListViewModel(super.state, this._ref);

  //final dio = Dio()..interceptors.add(CustomLogInterceptor());
  void init() {
    //전체 파티방 목록보기
    RoomRepository restApi = RoomRepository(Dio());
    restApi.findAllRoom(userId: 1).then((value) => value.data.isEmpty ? null : state = value.data as List<Room>);
  }
}
