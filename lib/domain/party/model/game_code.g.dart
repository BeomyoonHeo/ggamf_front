// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameCodeList _$GameCodeListFromJson(Map<String, dynamic> json) => GameCodeList(
      data: (json['data'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => GameCode.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$GameCodeListToJson(GameCodeList instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

GameCode _$GameCodeFromJson(Map<String, dynamic> json) => GameCode(
      id: json['id'] as int,
      logo: json['logo'] as String,
      gameName: json['gameName'] as String,
    );

Map<String, dynamic> _$GameCodeToJson(GameCode instance) => <String, dynamic>{
      'id': instance.id,
      'logo': instance.logo,
      'gameName': instance.gameName,
    };
