import 'package:json_annotation/json_annotation.dart';

part 'cancel_ggamf.g.dart';

@JsonSerializable()
class CancelGgamf {
  int followId;
  int userId;

  CancelGgamf({
    required this.followId,
    required this.userId,
  });

  factory CancelGgamf.fromJson(Map<String, dynamic> json) => _$CancelGgamfFromJson(json);

  Map<String, dynamic> toJson() => _$CancelGgamfToJson(this);
}
