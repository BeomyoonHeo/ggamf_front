import 'package:json_annotation/json_annotation.dart';

part 'generate_room_party.g.dart';

@JsonSerializable()
class GenerateRoomParty {
  String gameName;
  String roomName;
  int totalPeople;
  int userId;
  int gameCodeId;

  GenerateRoomParty({
    required this.gameName,
    required this.roomName,
    required this.totalPeople,
    required this.userId,
    required this.gameCodeId,
  });

  factory GenerateRoomParty.fromJson(Map<String, dynamic> json) => _$GenerateRoomPartyFromJson(json);

  Map<String, dynamic> toJson() => _$GenerateRoomPartyToJson(this);
}
