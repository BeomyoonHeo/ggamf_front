import 'package:ggamf_front/domain/party/model/room.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_room.g.dart';

@JsonSerializable()
class MyRoomList {
  Map<String, List<MyRoom>> data;
  MyRoomList({required this.data});

  factory MyRoomList.fromJson(Map<String, dynamic> json) => _$MyRoomListFromJson(json);
  Map<String, dynamic> toJson() => _$MyRoomListToJson(this);
}

@JsonSerializable()
class MyRoom {
  int id;
  String nickName;
  String roomName;
  int totalPeople;
  String gameLogo;

  MyRoom({
    required this.id,
    required this.nickName,
    required this.roomName,
    required this.totalPeople,
    required this.gameLogo,
  });

  factory MyRoom.fromJson(Map<String, dynamic> json) => _$MyRoomFromJson(json);

  Map<String, dynamic> toJson() => _$MyRoomToJson(this);
}
