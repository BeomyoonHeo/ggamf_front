// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinUserModel _$JoinUserModelFromJson(Map<String, dynamic> json) =>
    JoinUserModel(
      name: json['name'] as String,
      loginId: json['loginId'] as String,
      password: json['password'] as String,
      phoneNumber: json['phoneNumber'] as String,
      isSigned: json['isSigned'] as bool,
      nickname: json['nickname'] as String,
      email: json['email'] as String,
      isAgree: json['isAgree'] as bool,
    );

Map<String, dynamic> _$JoinUserModelToJson(JoinUserModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'loginId': instance.loginId,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
      'isSigned': instance.isSigned,
      'nickname': instance.nickname,
      'email': instance.email,
      'isAgree': instance.isAgree,
    };
