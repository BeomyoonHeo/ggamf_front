import 'package:json_annotation/json_annotation.dart';

part 'get_profile_user.g.dart';

@JsonSerializable()
class GetProfileUser {
  String? photo;
  String? nickname;
  String? intro;

  GetProfileUser({
    required this.photo,
    required this.nickname,
    required this.intro,
  });

  factory GetProfileUser.fromJson(Map<String, dynamic> json) => _$GetProfileUserFromJson(json);

  Map<String, dynamic> toJson() => _$GetProfileUserToJson(this);
}
