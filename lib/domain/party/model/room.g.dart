// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomList _$RoomListFromJson(Map<String, dynamic> json) => RoomList(
      data: (json['data'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => Room.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$RoomListToJson(RoomList instance) => <String, dynamic>{
      'data': instance.data,
    };

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
