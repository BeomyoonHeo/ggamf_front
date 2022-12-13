import 'package:json_annotation/json_annotation.dart';

part 'unfollow_ggamf.g.dart';

@JsonSerializable()
class UnfollowGgamf {
  int followId;
  int userId;

  UnfollowGgamf({
    required this.followId,
    required this.userId,
  });

  factory UnfollowGgamf.fromJson(Map<String, dynamic> json) => _$UnfollowGgamfFromJson(json);

  Map<String, dynamic> toJson() => _$UnfollowGgamfToJson(this);
}
