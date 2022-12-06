import 'package:json_annotation/json_annotation.dart';

part 'login_user.g.dart';

// @JsonSerializer 어노테이션사용해서 toJson, From.json 자동으로 바인딩 시켜주기
// flutter pub run build_runner build 로 build 하거나 flutter pub run build_runner watch 로 리스팅 할 수 있음
@JsonSerializable()
class LoginUser {
  final String loginId;
  final String password;

  LoginUser({required this.loginId, required this.password});

  Map<String, dynamic> toJson() => _$LoginUserToJson(this);
  factory LoginUser.fromJson(Map<String, dynamic> json) =>
      _$LoginUserFromJson(json);
}
