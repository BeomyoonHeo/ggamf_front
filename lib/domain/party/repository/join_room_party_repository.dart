import 'package:dio/dio.dart';
import 'package:ggamf_front/core/page_enum.dart';
import 'package:ggamf_front/domain/party/model/join_room_party.dart';
import 'package:retrofit/http.dart';

part 'join_room_party_repository.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class JoinRoomPartyRepository {
  factory JoinRoomPartyRepository(Dio dio) = _JoinRoomPartyRepository;

  @POST("/party/user/{userId}/join/{roomId}")
  Future<JoinRoomParty> joinRoom(
      {@Path('userId') required int userId, @Path('roomId') required int roomId, @Body() required JoinRoomParty joinRoomParty});
}
