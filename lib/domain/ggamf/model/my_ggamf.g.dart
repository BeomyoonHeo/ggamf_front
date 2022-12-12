// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_ggamf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyGgamfList _$MyGgamfListFromJson(Map<String, dynamic> json) => MyGgamfList(
      myGgamfList: (json['myGgamfList'] as List<dynamic>)
          .map((e) => MyGgamf.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyGgamfListToJson(MyGgamfList instance) =>
    <String, dynamic>{
      'myGgamfList': instance.myGgamfList,
    };

MyGgamf _$MyGgamfFromJson(Map<String, dynamic> json) => MyGgamf(
      photo: json['photo'] as String?,
      nickname: json['nickname'] as String?,
      intro: json['intro'] as String?,
    );

Map<String, dynamic> _$MyGgamfToJson(MyGgamf instance) => <String, dynamic>{
      'photo': instance.photo,
      'nickname': instance.nickname,
      'intro': instance.intro,
    };
