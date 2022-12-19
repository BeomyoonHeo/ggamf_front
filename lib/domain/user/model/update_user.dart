import 'package:json_annotation/json_annotation.dart';

part 'update_user.g.dart';

@JsonSerializable()
class UpdateUser {
  String? photo;
  String? nickname;
  String? intro;
  String? password;
  String? phone;
  String? email;

  UpdateUser({
    this.photo,
    required this.nickname,
    required this.intro,
    this.password,
    this.phone,
    this.email,
  });

  factory UpdateUser.fromJson(Map<String, dynamic> json) => _$UpdateUserFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserToJson(this);
}
