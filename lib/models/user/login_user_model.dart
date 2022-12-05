// @JsonSerializer 어노테이션사용해서 toJson, From.json 자동으로 바인딩 시켜주기
// flutter pub run build_runner build 로 build 하거나 flutter pub run build_runner watch 로 리스팅 할 수 있음
import 'package:json_annotation/json_annotation.dart';

part 'login_user_model.g.dart';

@JsonSerializable()
class LoginUserModel {
  final String loginId;
  final String password;

  LoginUserModel({required this.loginId, required this.password});

  // ex )  factory JoinUserRepository.fromJson(Map<String, dynamic> json) => _$JoinUserRepositoryFromJson(json);
  //   Map<String, dynamic> toJson() => _$JoinUserRepositoryToJson(this);

  Map<String, dynamic> toJson() => _$LoginUserModelToJson(this);
  factory LoginUserModel.fromJson(Map<String, dynamic> json) =>
      _$LoginUserModelFromJson(json);
}
