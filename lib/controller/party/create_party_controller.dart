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

  final Map<String, dynamic> _keyList = {'게임선택': 0, '리그 오브 레전드': 1, '오버워치': 2, '로스트아크': 3, '발로란트': 4, '기타': 5};

  Dio dio = Dio()..interceptors.add(CustomLogInterceptor());

  final TextEditingController partyNameController = TextEditingController();
  final TextEditingController selectGameController = TextEditingController();
  final TextEditingController totalPeopleController = TextEditingController();

  void requestCreateRoom() {
    logger.d("게임선택:${selectGameController.text}");
    logger.d("파티이름:${partyNameController.text}");
    logger.d("인원수:${int.parse(totalPeopleController.text)}");
    logger.d("게임코드:${_keyList[selectGameController.text]}");
    logger.d("유저 id : ${UserSession.user.id}");

    GenerateRoomParty createRoomParty = GenerateRoomParty(
      gameName: selectGameController.text,
      gameCodeId: _keyList[selectGameController.text],
      roomName: partyNameController.text,
      totalPeople: int.parse(totalPeopleController.text),
      userId: UserSession.user.id,
    );

    RoomRepository createRoomRepository = RoomRepository(dio);
    createRoomRepository.createRoom(userId: UserSession.user.id, gameCodeId: _keyList[selectGameController.text], generateRoomParty: createRoomParty);
  }
}
