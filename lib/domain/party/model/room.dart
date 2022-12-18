import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@JsonSerializable()
class RoomList {
  Map<String, List<Room>> data;
  RoomList({required this.data});

  factory RoomList.fromJson(Map<String, dynamic> json) =>
      _$RoomListFromJson(json);
  Map<String, dynamic> toJson() => _$RoomListToJson(this);
}

@JsonSerializable()
class Room {
  int id;
  String roomName;
  String gameName;
  String nickName;
  String? gameLogo;
  int? totalPeople;

  Room({
    required this.id,
    required this.roomName,
    required this.gameName,
    required this.nickName,
    this.gameLogo,
    this.totalPeople,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
