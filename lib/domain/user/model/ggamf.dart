import 'package:json_annotation/json_annotation.dart';

part 'ggamf.g.dart';

@JsonSerializable()
class GgamfList {
  List<Ggamf> data;

  GgamfList({required this.data});

  factory GgamfList.fromJson(Map<String, dynamic> json) =>
      _$GgamfListFromJson(json);
  Map<String, dynamic> toJson() => _$GgamfListToJson(this);
}

@JsonSerializable()
class Ggamf {
  int friendId;
  String nickName;
  String photo;
  String intro;

  Ggamf(
      {required this.friendId,
      required this.nickName,
      required this.photo,
      required this.intro});

  factory Ggamf.fromJson(Map<String, dynamic> json) => _$GgamfFromJson(json);
  Map<String, dynamic> toJson() => _$GgamfToJson(this);
}
