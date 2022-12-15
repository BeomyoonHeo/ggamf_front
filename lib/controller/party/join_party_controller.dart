import 'package:flutter_riverpod/flutter_riverpod.dart';

final joinPartyController = Provider((ref) {
  return JoinPartyController(ref);
});

class JoinPartyController {
  final Ref _ref;

  JoinPartyController(this._ref);

  //검색해서 보기
}
