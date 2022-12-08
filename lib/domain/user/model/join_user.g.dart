// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinUser _$JoinUserFromJson(Map<String, dynamic> json) => JoinUser(
      name: json['name'] as String,
      loginId: json['username'] as String,
      password: json['password'] as String,
      phoneNumber: json['phone'] as String,
      nickname: json['nickname'] as String,
      email: json['email'] as String,
      isAgree: json['isAgree'] as bool,
    );

Map<String, dynamic> _$JoinUserToJson(JoinUser instance) => <String, dynamic>{
      'name': instance.name,
      'username': instance.loginId,
      'password': instance.password,
      'phone': instance.phoneNumber,
      'nickname': instance.nickname,
      'email': instance.email,
      'isAgree': instance.isAgree,
    };
