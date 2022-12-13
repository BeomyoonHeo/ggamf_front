// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      username: json['username'] as String?,
      id: json['id'] as int,
      backgroundImage: json['backgroundImage'] as String?,
      name: json['name'] as String?,
      intro: json['intro'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'backgroundImage': instance.backgroundImage,
      'name': instance.name,
      'intro': instance.intro,
    };
