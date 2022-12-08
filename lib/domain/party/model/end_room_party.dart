import 'package:json_annotation/json_annotation.dart';

part 'end_room_party.g.dart';

@JsonSerializable()
class EndRoomParty {
  int userId;
  int roomId;

  EndRoomParty({
    required this.userId,
    required this.roomId,
  });

  factory EndRoomParty.fromJson(Map<String, dynamic> json) => _$EndRoomPartyFromJson(json);

  Map<String, dynamic> toJson() => _$EndRoomPartyToJson(this);
}
