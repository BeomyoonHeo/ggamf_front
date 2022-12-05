import 'package:json_annotation/json_annotation.dart';

part 'join_user_model.g.dart';

@JsonSerializable()
class JoinUserModel {
  final String name;
  final String loginId;
  final String password;
  final String phoneNumber;
  final bool isSigned;
  final String nickname;
  final String email;
  final bool isAgree;

  JoinUserModel({
    required this.name,
    required this.loginId,
    required this.password,
    required this.phoneNumber,
    required this.isSigned,
    required this.nickname,
    required this.email,
    required this.isAgree,
  });

  factory JoinUserModel.fromJson(Map<String, dynamic> json) =>
      _$JoinUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$JoinUserModelToJson(this);
}
