import 'package:json_annotation/json_annotation.dart';

part 'my_ggamf.g.dart';

@JsonSerializable()
class MyGgamfList {
  List<MyGgamf> myGgamfList;

  MyGgamfList({required this.myGgamfList});

  factory MyGgamfList.fromJson(Map<String, dynamic> json) => _$MyGgamfListFromJson(json);
  Map<String, dynamic> toJson() => _$MyGgamfListToJson(this);
}

@JsonSerializable()
class MyGgamf {
  String photo;
  String nickname;
  String intro;

  MyGgamf({
    required this.photo,
    required this.nickname,
    required this.intro,
  });

  factory MyGgamf.fromJson(Map<String, dynamic> json) => _$MyGgamfFromJson(json);

  Map<String, dynamic> toJson() => _$MyGgamfToJson(this);
}
