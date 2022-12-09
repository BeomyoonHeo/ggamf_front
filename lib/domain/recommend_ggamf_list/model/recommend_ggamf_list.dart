import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RecommendGgamfList {
  List<RecommendGgamf> data;

  RecommendGgamfList({required this.data});

  factory RecommendGgamfList.fromJson(Map<String, dynamic> json) =>
      _$RecommendGgamfListFromJson(json);
  Map<String, dynamic> toJson() => _$RecommendGgamfListToJson(this);
}

@JsonSerializable()
class RecommendGgamf {
  @JsonKey(name: 'first_name')
  String nickname;
  @JsonKey(name: 'avatar')
  String profilePicture;
  @JsonKey(name: 'last_name')
  String stateMessage;

  RecommendGgamf(
      {required this.nickname,
      required this.profilePicture,
      required this.stateMessage});

  factory RecommendGgamf.fromJson(Map<String, dynamic> json) =>
      _$RecommendGgamfFromJson(json);
  Map<String, dynamic> toJson() => _$RecommendGgamfToJson(this);
}
