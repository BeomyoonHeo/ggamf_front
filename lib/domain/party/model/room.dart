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
class Room {
  int id;
  String gameName;
  String roomName;
  int totalPeople;
  bool active;

  Room({
    required this.id,
    required this.gameName,
    required this.roomName,
    required this.totalPeople,
    required this.active,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
