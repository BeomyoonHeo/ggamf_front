import 'package:json_annotation/json_annotation.dart';

part 'ggamf.g.dart';

@JsonSerializable()
class GgamfList {
  Map<String, List<Ggamf>> data;
  GgamfList({required this.data});

  factory GgamfList.fromJson(Map<String, dynamic> json) =>
      _$GgamfListFromJson(json);
  Map<String, dynamic> toJson() => _$GgamfListToJson(this);
}

@JsonSerializable()
class Ggamf {
  int userId;
  String nickName;
  String photo;
  String intro;

  Ggamf(
      {required this.userId,
      required this.nickName,
      required this.photo,
      required this.intro});

  factory Ggamf.fromJson(Map<String, dynamic> json) => _$GgamfFromJson(json);
  Map<String, dynamic> toJson() => _$GgamfToJson(this);
}
