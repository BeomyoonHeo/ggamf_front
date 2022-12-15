// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_room_party.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateRoomParty _$GenerateRoomPartyFromJson(Map<String, dynamic> json) =>
    GenerateRoomParty(
      gameName: json['gameName'] as String?,
      roomName: json['roomName'] as String?,
      totalPeople: json['totalPeople'] as int?,
      userId: json['userId'] as int?,
      gameCodeId: json['gameCodeId'] as int?,
    );

Map<String, dynamic> _$GenerateRoomPartyToJson(GenerateRoomParty instance) =>
    <String, dynamic>{
      'gameName': instance.gameName,
      'roomName': instance.roomName,
      'totalPeople': instance.totalPeople,
      'userId': instance.userId,
      'gameCodeId': instance.gameCodeId,
    };
