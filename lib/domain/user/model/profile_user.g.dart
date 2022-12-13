// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileUser _$ProfileUserFromJson(Map<String, dynamic> json) => ProfileUser(
      photo: json['photo'] as String?,
      nickname: json['nickname'] as String?,
      intro: json['intro'] as String?,
      password: json['password'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ProfileUserToJson(ProfileUser instance) =>
    <String, dynamic>{
      'photo': instance.photo,
      'nickname': instance.nickname,
      'intro': instance.intro,
      'password': instance.password,
      'phone': instance.phone,
      'email': instance.email,
    };
