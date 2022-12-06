import 'package:json_annotation/json_annotation.dart';

part 'join_user.g.dart';

@JsonSerializable()
class JoinUser {
  String name;
  String loginId;
  String password;
  String phoneNumber;
  bool isSigned;
  String nickname;
  String email;
  bool isAgree;

  JoinUser({
    required this.name,
    required this.loginId,
    required this.password,
    required this.phoneNumber,
    required this.isSigned,
    required this.nickname,
    required this.email,
    required this.isAgree,
  });

  factory JoinUser.fromJson(Map<String, dynamic> json) =>
      _$JoinUserFromJson(json);

  Map<String, dynamic> toJson() => _$JoinUserToJson(this);
}
