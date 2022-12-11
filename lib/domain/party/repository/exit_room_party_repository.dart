import 'package:dio/dio.dart';
import 'package:ggamf_front/core/page_enum.dart';
import 'package:ggamf_front/domain/party/model/exit_room_party.dart';
import 'package:retrofit/http.dart';

part 'exit_room_party_repository.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ExitRoomPartyRepository {
  factory ExitRoomPartyRepository(Dio dio) = _ExitRoomPartyRepository;

  @PUT("/party/user/{userId}/exit/{roomId}")
  Future<ExitRoomParty> exitRoom(
      {@Path('userId') required int userId, @Path('roomId') required int roomId, @Body() required ExitRoomParty exitRoomParty});
}
