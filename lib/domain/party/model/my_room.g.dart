// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyRoomList _$MyRoomListFromJson(Map<String, dynamic> json) => MyRoomList(
      data: (json['data'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => MyRoom.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$MyRoomListToJson(MyRoomList instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

MyRoom _$MyRoomFromJson(Map<String, dynamic> json) => MyRoom(
      id: json['id'] as int,
      roomName: json['roomName'] as String,
      gameLogo: json['gameLogo'] as String,
      totalPeople: json['totalPeople'] as int?,
    );

Map<String, dynamic> _$MyRoomToJson(MyRoom instance) => <String, dynamic>{
      'id': instance.id,
      'roomName': instance.roomName,
      'totalPeople': instance.totalPeople,
      'gameLogo': instance.gameLogo,
    };
