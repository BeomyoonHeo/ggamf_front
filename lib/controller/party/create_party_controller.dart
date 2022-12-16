import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/party/model/generate_room_party.dart';
import 'package:ggamf_front/domain/party/repository/room_repository.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/main.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';
import 'package:ggamf_front/utils/validator_util.dart';
import 'package:ggamf_front/views/pages/my_party/my_recruitment_party_list/my_recruitment_party_list_view_model.dart';

final createPartyController = Provider((ref) {
  return CreatePartyController(ref);
});

class CreatePartyController {
  final Ref _ref;

  CreatePartyController(this._ref);

  final Map<String, dynamic> _keyList = {'게임선택': 0, '리그 오브 레전드': 1, '오버워치': 2, '로스트아크': 3, '발로란트': 4, '기타': 5};

  final mContext = navigatorKey.currentContext;

  late RoomRepository repo = RoomRepository(Dio()
    ..interceptors.add(CustomLogInterceptor())
    ..interceptors.add(SignedInterceptor()));

  final TextEditingController partyNameController = TextEditingController();
  final TextEditingController selectGameController = TextEditingController();
  final TextEditingController totalPeopleController = TextEditingController();

  void requestCreateRoom() {
    GenerateRoomParty createRoomParty = GenerateRoomParty(
      gameName: selectGameController.text,
      gameCodeId: _keyList[selectGameController.text],
      roomName: partyNameController.text,
      totalPeople: int.parse(totalPeopleController.text),
      userId: UserSession.user.id,
    );

    repo
        .createRoom(userId: UserSession.user.id, gameCodeId: _keyList[selectGameController.text], generateRoomParty: createRoomParty)
        .then((value) => _ref.read(myRecruitmentPartyListViewModel.notifier).updateMyRecruitmentParty());

    Navigator.pop(mContext!);
  }
}
