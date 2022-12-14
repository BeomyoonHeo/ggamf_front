import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/party/model/generate_room_party.dart';
import 'package:ggamf_front/domain/party/repository/room_repository.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';
import 'package:ggamf_front/utils/validator_util.dart';

final createPartyController = Provider((ref) {
  return CreatePartyController(ref);
});

class CreatePartyController {
  final Ref _ref;

  CreatePartyController(this._ref);

  final TextEditingController partyNameController = TextEditingController();
  final TextEditingController selectGameController = TextEditingController();
  final TextEditingController totalPeopleController = TextEditingController();

  Dio dio = Dio()..interceptors.add(CustomLogInterceptor());

  void requestCreateRoom() {
    logger.d("${selectGameController.text}");

    logger.d("${partyNameController.text}");
    logger.d("${int.parse(totalPeopleController.text)}");
    logger.d("${UserSession.user.id}");

    GenerateRoomParty createRoomParty = GenerateRoomParty(
      gameName: selectGameController.text,
      gameCodeId: 3,
      roomName: partyNameController.text,
      totalPeople: int.parse(totalPeopleController.text),
      userId: UserSession.user.id,
    );
    logger.d(int.parse(selectGameController.text));

    RoomRepository createRoomRepository = RoomRepository(dio);
    createRoomRepository.createRoom(userId: UserSession.user.id, gameCodeId: 3, generateRoomParty: createRoomParty);
  }
}
