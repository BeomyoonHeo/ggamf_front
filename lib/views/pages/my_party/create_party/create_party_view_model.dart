import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/controller/party/create_party_controller.dart';
import 'package:ggamf_front/domain/party/model/generate_room_party.dart';
import 'package:ggamf_front/domain/party/repository/room_repository.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/utils/validator_util.dart';

import '../../../../domain/party/model/game_code.dart';
import '../../../../utils/custom_intercepter.dart';

final createPartyViewModel = StateNotifierProvider<CreatePartyViewModel, List<GameCode>?>((ref) {
  final cpc = ref.read(createPartyController);
  return CreatePartyViewModel(null, ref);
});

class CreatePartyViewModel extends StateNotifier<List<GameCode>?> {
  final _ref;
  CreatePartyViewModel(super.state, this._ref);

  RoomRepository repo = RoomRepository(Dio()
    ..interceptors.add(CustomLogInterceptor())
    ..interceptors.add(SignedInterceptor()));

  List<GameCode> gameCodeList = [];

  void getGameCode() {
    repo.getGameCode(userId: UserSession.user.id).then(
      (value) {
        logger.d("코드밸류 확인 ${value}");
        value.data['followers']?.forEach(
          (_gameCode) {
            gameCodeList.add(
              GameCode(
                id: _gameCode.id,
                gameName: _gameCode.gameName,
                logo: _gameCode.logo,
              ),
            );
          },
        );
      },
    );
    state = gameCodeList;
  }
// void updateState() {
//   final juc = _ref.read(joinUserController);
// }
}
