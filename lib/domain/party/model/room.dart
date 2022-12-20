import 'package:ggamf_front/domain/party/model/generate_room_party.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@JsonSerializable()
class RoomList {
  Map<String, List<Room>> data;
  RoomList({required this.data});

  factory RoomList.fromJson(Map<String, dynamic> json) => _$RoomListFromJson(json);
  Map<String, dynamic> toJson() => _$RoomListToJson(this);
}

@JsonSerializable()
class RoomList2 {
  List<Room> data;
  RoomList2({required this.data});

  factory RoomList2.fromJson(Map<String, dynamic> json) => _$RoomList2FromJson(json);
  Map<String, dynamic> toJson() => _$RoomList2ToJson(this);
}

@JsonSerializable()
class SingleRoom {
  Room data;
  SingleRoom({required this.data});
  factory SingleRoom.fromJson(Map<String, dynamic> json) => _$SingleRoomFromJson(json);

  Map<String, dynamic> toJson() => _$SingleRoomToJson(this);

  GenerateRoomParty toGenerateRoomParty(int codeId) {
    return GenerateRoomParty(
        gameName: data.gameName, roomName: data.roomName, totalPeople: data.totalPeople, userId: UserSession.user.id, gameCodeId: codeId);
  }
}

@JsonSerializable()
class Room {
  int id;
  String roomName;
  String gameName;
  String? nickName;
  String? gameLogo;
  int? totalPeople;
  int? count;
  String? uid;

  Room({
    required this.id,
    required this.roomName,
    required this.gameName,
    required this.nickName,
    this.gameLogo,
    this.totalPeople,
    this.count,
    this.uid,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
