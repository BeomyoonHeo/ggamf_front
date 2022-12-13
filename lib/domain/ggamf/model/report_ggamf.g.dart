// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_ggamf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportGgamf _$ReportGgamfFromJson(Map<String, dynamic> json) => ReportGgamf(
      badUserId: json['badUserId'] as int,
      userId: json['userId'] as int,
      detail: json['detail'] as String,
      reasonCodeId: json['reasonCodeId'] as int,
    );

Map<String, dynamic> _$ReportGgamfToJson(ReportGgamf instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'badUserId': instance.badUserId,
      'userId': instance.userId,
      'reasonCodeId': instance.reasonCodeId,
    };
