import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/party/model/generate_room_party.dart';
import 'package:ggamf_front/domain/party/repository/room_repository.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';

final createPartyController = Provider((ref) {
  return CreatePartyController(ref);
});

class CreatePartyController {
  final Ref _ref;

  CreatePartyController(this._ref);

  final repo = RoomRepository(Dio()..interceptors.add(CustomLogInterceptor()));

  void createRoom(GenerateRoomParty generateRoomParty) async {
    GenerateRoomParty createRoom = await repo.createRoom(userId: 1, roomId: 1, generateRoomParty: generateRoomParty);
  }
}
