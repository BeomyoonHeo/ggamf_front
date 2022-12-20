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

RoomList2 _$RoomList2FromJson(Map<String, dynamic> json) => RoomList2(
      data: (json['data'] as List<dynamic>)
          .map((e) => Room.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoomList2ToJson(RoomList2 instance) => <String, dynamic>{
      'data': instance.data,
    };

SingleRoom _$SingleRoomFromJson(Map<String, dynamic> json) => SingleRoom(
      data: Room.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SingleRoomToJson(SingleRoom instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      id: json['id'] as int,
      roomName: json['roomName'] as String,
      gameName: json['gameName'] as String,
      nickName: json['nickName'] as String?,
      gameLogo: json['gameLogo'] as String?,
      totalPeople: json['totalPeople'] as int?,
      count: json['count'] as int?,
      uid: json['uid'] as String?,
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'id': instance.id,
      'roomName': instance.roomName,
      'gameName': instance.gameName,
      'nickName': instance.nickName,
      'gameLogo': instance.gameLogo,
      'totalPeople': instance.totalPeople,
      'count': instance.count,
      'uid': instance.uid,
    };
