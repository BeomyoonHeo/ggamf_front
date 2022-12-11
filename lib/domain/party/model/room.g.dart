// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      id: json['id'] as int,
      gameName: json['gameName'] as String,
      roomName: json['roomName'] as String,
      totalPeople: json['totalPeople'] as int,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'id': instance.id,
      'gameName': instance.gameName,
      'roomName': instance.roomName,
      'totalPeople': instance.totalPeople,
      'active': instance.active,
    };
