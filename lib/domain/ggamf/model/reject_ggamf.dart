import 'package:json_annotation/json_annotation.dart';

part 'reject_ggamf.g.dart';

@JsonSerializable()
class RejectGgamf {
  int followId;
  int userId;

  RejectGgamf({
    required this.followId,
    required this.userId,
  });

  factory RejectGgamf.fromJson(Map<String, dynamic> json) => _$RejectGgamfFromJson(json);

  Map<String, dynamic> toJson() => _$RejectGgamfToJson(this);
}
