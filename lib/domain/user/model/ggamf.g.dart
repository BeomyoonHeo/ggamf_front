// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ggamf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GgamfList _$GgamfListFromJson(Map<String, dynamic> json) => GgamfList(
      data: (json['data'] as List<dynamic>)
          .map((e) => Ggamf.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GgamfListToJson(GgamfList instance) => <String, dynamic>{
      'data': instance.data,
    };

Ggamf _$GgamfFromJson(Map<String, dynamic> json) => Ggamf(
      friendId: json['friendId'] as int,
      nickName: json['nickName'] as String,
      photo: json['photo'] as String,
      intro: json['intro'] as String,
    );

Map<String, dynamic> _$GgamfToJson(Ggamf instance) => <String, dynamic>{
      'friendId': instance.friendId,
      'nickName': instance.nickName,
      'photo': instance.photo,
      'intro': instance.intro,
    };
