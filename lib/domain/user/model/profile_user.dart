import 'package:json_annotation/json_annotation.dart';

part 'profile_user.g.dart';

@JsonSerializable()
class ProfileUser {
  String? photo;
  String? nickname;
  String? intro;

  ProfileUser({
    this.photo,
    required this.nickname,
    required this.intro,
  });

  factory ProfileUser.fromJson(Map<String, dynamic> json) => _$ProfileUserFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileUserToJson(this);
}
