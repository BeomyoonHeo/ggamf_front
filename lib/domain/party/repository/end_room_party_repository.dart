import 'package:dio/dio.dart';
import 'package:ggamf_front/core/page_enum.dart';
import 'package:ggamf_front/domain/party/model/end_room_party.dart';
import 'package:retrofit/http.dart';

part 'end_room_party_repository.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class EndRoomPartyRepository {
  factory EndRoomPartyRepository(Dio dio) = _EndRoomPartyRepository;

  @PUT("/party/user/{userId}/end/{roomId}")
  Future<EndRoomParty> endRoom(
      {@Path('userId') required int userId, @Path('roomId') required int roomId, @Body() required EndRoomParty endRoomParty});
}
