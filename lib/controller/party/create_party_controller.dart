import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
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

  final TextEditingController partyNameController = TextEditingController();
  final TextEditingController selectGameController = TextEditingController();
  final TextEditingController totalPeopleController = TextEditingController();

  final repo = RoomRepository(Dio()..interceptors.add(CustomLogInterceptor()));

  void requestCreateRoom() {
    GenerateRoomParty generateRoomParty = GenerateRoomParty(
      gameName: selectGameController.text,
      gameCodeId: int.parse(selectGameController.text),
      roomName: partyNameController.text,
      totalPeople: int.parse(totalPeopleController.text),
      userId: 3,
    );
  }
}
