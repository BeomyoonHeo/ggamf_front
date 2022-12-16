import 'package:ggamf_front/domain/party/model/my_room.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generate_room_party.g.dart';

@JsonSerializable()
class GenerateRoomParty {
  String? gameName;
  String? roomName;
  int? totalPeople;
  int? userId;
  int? gameCodeId;

  GenerateRoomParty({
    required this.gameName,
    required this.roomName,
    required this.totalPeople,
    required this.userId,
    required this.gameCodeId,
  });

  //Dto 데이터를 -> MyRoomType으로 변환 필요
  MyRoom createdParty() {
    return MyRoom(
        id: 1,
        nickName: 'nickName',
        roomName: 'roomName',
        totalPeople: 2,
        gameLogo: 'gameLogo');
  }

  factory GenerateRoomParty.fromJson(Map<String, dynamic> json) =>
      _$GenerateRoomPartyFromJson(json);

  Map<String, dynamic> toJson() => _$GenerateRoomPartyToJson(this);
}
