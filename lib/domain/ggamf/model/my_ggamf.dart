import 'package:json_annotation/json_annotation.dart';

part 'my_ggamf.g.dart';

@JsonSerializable()
class MyGgamf {
  String? photo;
  String? nickname;
  String? intro;

  MyGgamf({
    required this.photo,
    required this.nickname,
    required this.intro,
  });

  factory MyGgamf.fromJson(Map<String, dynamic> json) => _$MyGgamfFromJson(json);

  Map<String, dynamic> toJson() => _$MyGgamfToJson(this);
}
