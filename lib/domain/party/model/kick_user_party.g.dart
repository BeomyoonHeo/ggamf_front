// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kick_user_party.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KickUserParty _$KickUserPartyFromJson(Map<String, dynamic> json) =>
    KickUserParty(
      userId: json['userId'] as int,
      roomId: json['roomId'] as int,
      kickUserId: json['kickUserId'] as int,
    );

Map<String, dynamic> _$KickUserPartyToJson(KickUserParty instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'roomId': instance.roomId,
      'kickUserId': instance.kickUserId,
    };
