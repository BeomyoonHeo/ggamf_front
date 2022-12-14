import 'package:json_annotation/json_annotation.dart';

part 'join_user.g.dart';

@JsonSerializable()
class JoinUser {
  String name;
  @JsonKey(name: 'username')
  String loginId;
  String password;
  @JsonKey(name: 'phone')
  String phoneNumber;
  String nickname;
  String email;
  String uid;
  bool isAgree;

  JoinUser({
    required this.name,
    required this.loginId,
    required this.password,
    required this.phoneNumber,
    required this.nickname,
    required this.email,
    required this.uid,
    required this.isAgree,
  });

  factory JoinUser.fromJson(Map<String, dynamic> json) =>
      _$JoinUserFromJson(json);

  Map<String, dynamic> toJson() => _$JoinUserToJson(this);
}
