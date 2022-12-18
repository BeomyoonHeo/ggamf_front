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
      roomName: json['roomName'] as String,
      gameName: json['gameName'] as String,
      nickName: json['nickName'] as String,
      gameLogo: json['gameLogo'] as String?,
      totalPeople: json['totalPeople'] as int?,
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'id': instance.id,
      'roomName': instance.roomName,
      'gameName': instance.gameName,
      'nickName': instance.nickName,
      'gameLogo': instance.gameLogo,
      'totalPeople': instance.totalPeople,
    };
