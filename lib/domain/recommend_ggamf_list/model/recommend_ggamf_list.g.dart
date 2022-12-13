// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_ggamf_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendGgamfList _$RecommendGgamfListFromJson(Map<String, dynamic> json) =>
    RecommendGgamfList(
      data: (json['data'] as List<dynamic>)
          .map((e) => RecommendGgamf.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecommendGgamfListToJson(RecommendGgamfList instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

RecommendGgamf _$RecommendGgamfFromJson(Map<String, dynamic> json) =>
    RecommendGgamf(
      nickname: json['first_name'] as String,
      profilePicture: json['avatar'] as String,
      stateMessage: json['last_name'] as String,
    );

Map<String, dynamic> _$RecommendGgamfToJson(RecommendGgamf instance) =>
    <String, dynamic>{
      'first_name': instance.nickname,
      'avatar': instance.profilePicture,
      'last_name': instance.stateMessage,
    };
