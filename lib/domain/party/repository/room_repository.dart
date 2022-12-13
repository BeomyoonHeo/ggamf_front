import 'package:dio/dio.dart';
import 'package:ggamf_front/domain/party/model/end_room_party.dart';
import 'package:ggamf_front/domain/party/model/exit_room_party.dart';
import 'package:ggamf_front/domain/party/model/kick_user_party.dart';
import 'package:ggamf_front/domain/party/model/room.dart';
import 'package:retrofit/http.dart';

import '../../../core/page_enum.dart';
import '../model/generate_room_party.dart';
import '../model/join_room_party.dart';

part 'room_repository.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class RoomRepository {
  factory RoomRepository(Dio dio) = _RoomRepository;

  // 파티방 상세보기
  @GET("/s/api/party/user/{userId}/detail/{roomId}")
  Future<Room> detailRoom({@Path('roomId') required int roomId, @Path('userId') required int userId});

  // 나의 모집 파티 목록
  @GET("/s/api/party/user/{userId}/myrooms")
  Future<Room> findByMyIdRoom({@Path('roomId') required int roomId});

  // 전체 파티방 목록 보기
  @GET("/s/api/party/user/{userId}/list")
  Future<RoomList> findAllRoom({@Path('userId') required int userId});

  // 참가중인 파티방 목록 보기
  @GET("/s/api/party/user/{userId}/joins")
  Future<Room> findJoinRooms({@Path('userId') required int userId});

  //파티원 추방(방장)
  @PUT("/s/api/party/user/{userId}/kick/{roomId}")
  Future<KickUserParty> kickUser(
      {@Path('userId') required int userId, @Path('roomId') required int roomId, @Body() required KickUserParty kickUserParty});

  //파티방 종료(방장)
  @PUT("/s/api/party/user/{userId}/end/{roomId}")
  Future<EndRoomParty> endRoom(
      {@Path('userId') required int userId, @Path('roomId') required int roomId, @Body() required EndRoomParty endRoomParty});

  //파티방 나가기
  @PUT("/s/api/party/user/{userId}/exit/{roomId}")
  Future<ExitRoomParty> exitRoom(
      {@Path('userId') required int userId, @Path('roomId') required int roomId, @Body() required ExitRoomParty exitRoomParty});

  //파티방 생성하기
  @POST("/s/api/party/user/{userId}/create/{roomId}")
  Future<GenerateRoomParty> createRoom(
      {@Path('userId') required int userId, @Path('roomId') required int roomId, @Body() required GenerateRoomParty generateRoomParty});

  //파티방 참여하기
  @POST("/s/api/party/user/{userId}/join/{roomId}")
  Future<JoinRoomParty> joinRoom(
      {@Path('userId') required int userId, @Path('roomId') required int roomId, @Body() required JoinRoomParty joinRoomParty});
}
