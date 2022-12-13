// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUser _$UpdateUserFromJson(Map<String, dynamic> json) => UpdateUser(
      id: json['id'] as int?,
      photo: json['photo'] as String?,
      nickname: json['nickname'] as String?,
      intro: json['intro'] as String?,
      password: json['password'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UpdateUserToJson(UpdateUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'photo': instance.photo,
      'nickname': instance.nickname,
      'intro': instance.intro,
      'password': instance.password,
      'phone': instance.phone,
      'email': instance.email,
    };
