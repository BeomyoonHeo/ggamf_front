import 'package:json_annotation/json_annotation.dart';

part 'game_code.g.dart';

@JsonSerializable()
class GameCodeList {
  Map<String, List<GameCode>> data;
  GameCodeList({required this.data});

  factory GameCodeList.fromJson(Map<String, dynamic> json) => _$GameCodeListFromJson(json);
  Map<String, dynamic> toJson() => _$GameCodeListToJson(this);
}

@JsonSerializable()
class GameCode {
  int id;
  String logo;
  String gameName;

  GameCode({
    required this.id,
    required this.logo,
    required this.gameName,
  });

  factory GameCode.fromJson(Map<String, dynamic> json) => _$GameCodeFromJson(json);
  Map<String, dynamic> toJson() => _$GameCodeToJson(this);
}
