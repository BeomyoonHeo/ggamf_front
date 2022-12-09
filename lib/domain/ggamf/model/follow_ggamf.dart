import 'package:json_annotation/json_annotation.dart';

part 'follow_ggamf.g.dart';

@JsonSerializable()
class FollowGgamf {
  int followerId;
  int followingId;

  FollowGgamf({
    required this.followerId,
    required this.followingId,
  });

  factory FollowGgamf.fromJson(Map<String, dynamic> json) => _$FollowGgamfFromJson(json);

  Map<String, dynamic> toJson() => _$FollowGgamfToJson(this);
}
