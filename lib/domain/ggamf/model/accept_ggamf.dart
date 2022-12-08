import 'package:json_annotation/json_annotation.dart';

part 'accept_ggamf.g.dart';

@JsonSerializable()
class AcceptGgamf {
  int followerId;
  int userId;

  AcceptGgamf({
    required this.followerId,
    required this.userId,
  });

  factory AcceptGgamf.fromJson(Map<String, dynamic> json) => _$AcceptGgamfFromJson(json);

  Map<String, dynamic> toJson() => _$AcceptGgamfToJson(this);
}
