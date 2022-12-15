// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileUser _$ProfileUserFromJson(Map<String, dynamic> json) => ProfileUser(
      photo: json['photo'] as String,
      nickname: json['nickname'] as String,
      intro: json['intro'] as String,
    );

Map<String, dynamic> _$ProfileUserToJson(ProfileUser instance) =>
    <String, dynamic>{
      'photo': instance.photo,
      'nickname': instance.nickname,
      'intro': instance.intro,
    };
