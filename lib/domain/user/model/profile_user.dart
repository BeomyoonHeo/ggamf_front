import 'package:json_annotation/json_annotation.dart';

part 'profile_user.g.dart';

@JsonSerializable()
class ProfileUser {
  String? photo;
  String? nickname;
  String? intro;
  String? password;
  String? phone;
  String? email;

  ProfileUser({
    required this.photo,
    required this.nickname,
    required this.intro,
    this.password,
    this.phone,
    this.email,
  });

  factory ProfileUser.fromJson(Map<String, dynamic> json) =>
      _$ProfileUserFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileUserToJson(this);
}
