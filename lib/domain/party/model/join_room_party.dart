import 'package:json_annotation/json_annotation.dart';

part 'join_room_party.g.dart';

@JsonSerializable()
class JoinRoomParty {
  int userId;
  int roomId;

  JoinRoomParty({
    required this.userId,
    required this.roomId,
  });

  factory JoinRoomParty.fromJson(Map<String, dynamic> json) => _$JoinRoomPartyFromJson(json);

  Map<String, dynamic> toJson() => _$JoinRoomPartyToJson(this);
}
