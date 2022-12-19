// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ggamf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GgamfList _$GgamfListFromJson(Map<String, dynamic> json) => GgamfList(
      data: (json['data'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => Ggamf.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$GgamfListToJson(GgamfList instance) => <String, dynamic>{
      'data': instance.data,
    };

Ggamf _$GgamfFromJson(Map<String, dynamic> json) => Ggamf(
      userId: json['userId'] as int,
      nickname: json['nickname'] as String,
      photo: json['photo'] as String,
      intro: json['intro'] as String,
      isFollowing: json['isFollowing'] as bool?,
    );

Map<String, dynamic> _$GgamfToJson(Ggamf instance) => <String, dynamic>{
      'userId': instance.userId,
      'nickname': instance.nickname,
      'photo': instance.photo,
      'intro': instance.intro,
      'isFollowing': instance.isFollowing,
    };
