import 'package:dio/dio.dart';
import 'package:ggamf_front/core/page_enum.dart';
import 'package:ggamf_front/domain/party/model/kick_user_party.dart';
import 'package:retrofit/http.dart';

part 'kick_user_party_repository.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class KickUserPartyRepository {
  factory KickUserPartyRepository(Dio dio) = _KickUserPartyRepository;

  @PUT("/party/user/{userId}/kick/{roomId}")
  Future<KickUserParty> kickUser(
      {@Path('userId') required int userId, @Path('roomId') required int roomId, @Body() required KickUserParty kickUserParty});
}
