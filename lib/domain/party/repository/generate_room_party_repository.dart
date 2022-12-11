import 'package:dio/dio.dart';
import 'package:ggamf_front/core/page_enum.dart';
import 'package:ggamf_front/domain/party/model/generate_room_party.dart';
import 'package:retrofit/http.dart';

part 'generate_room_party_repository.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class GenerateRoomPartyRepository {
  factory GenerateRoomPartyRepository(Dio dio) = _GenerateRoomPartyRepository;

  @POST("/party/user/{userId}/create/{roomId}")
  Future<GenerateRoomParty> createRoom(
      {@Path('userId') required int userId, @Path('roomId') required int roomId, @Body() required GenerateRoomParty generateRoomParty});
}
