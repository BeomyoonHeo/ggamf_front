import 'package:dio/dio.dart';
import 'package:ggamf_front/domain/party/model/room.dart';
import 'package:retrofit/http.dart';

import '../../../core/page_enum.dart';

part 'room_repository.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class RoomRepository {
  factory RoomRepository(Dio dio) = _RoomRepository;

  // 파티방 상세보기
  @GET("/party/user/{userId}/detail/{roomId}")
  Future<Room> detailRoom({@Path('roomId') required int roomId, @Path('userId') required int userId});

  // 나의 모집 파티 목록
  @GET("/party/user/{userId}/myrooms")
  Future<Room> findByMyIdRoom({@Path('roomId') required int roomId});

  // 전체 파티방 목록 보기
  @GET("/party/user/{userId}/list")
  Future<RoomList> findAllRoom({@Path('userId') required int userId});

  // 참가중인 파티방 목록 보기
  @GET("/party/user/{userId}/joins")
  Future<Room> findJoinRooms({@Path('userId') required int userId});
}
