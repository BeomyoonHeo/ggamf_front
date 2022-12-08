import 'package:json_annotation/json_annotation.dart';

part 'kick_user_party.g.dart';

@JsonSerializable()
class KickUserParty {
  int userId;
  int roomId;
  int kickUserId;

  KickUserParty({
    required this.userId,
    required this.roomId,
    required this.kickUserId,
  });

  factory KickUserParty.fromJson(Map<String, dynamic> json) => _$KickUserPartyFromJson(json);

  Map<String, dynamic> toJson() => _$KickUserPartyToJson(this);
}
