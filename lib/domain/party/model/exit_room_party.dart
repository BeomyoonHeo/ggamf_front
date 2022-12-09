import 'package:json_annotation/json_annotation.dart';

part 'exit_room_party.g.dart';

@JsonSerializable()
class ExitRoomParty {
  int userId;
  int roomId;

  ExitRoomParty({
    required this.userId,
    required this.roomId,
  });

  factory ExitRoomParty.fromJson(Map<String, dynamic> json) => _$ExitRoomPartyFromJson(json);

  Map<String, dynamic> toJson() => _$ExitRoomPartyToJson(this);
}
