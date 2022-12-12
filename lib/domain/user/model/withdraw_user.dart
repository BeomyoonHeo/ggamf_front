import 'package:json_annotation/json_annotation.dart';

part 'withdraw_user.g.dart';

@JsonSerializable()
class WithdrawUser {
  int? id;
  String? state;

  WithdrawUser({
    required this.id,
    required this.state,
  });

  factory WithdrawUser.fromJson(Map<String, dynamic> json) => _$WithdrawUserFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawUserToJson(this);
}
