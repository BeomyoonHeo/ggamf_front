import 'package:dio/dio.dart';
import 'package:ggamf_front/core/page_enum.dart';
import 'package:retrofit/http.dart';

import '../model/follow_ggamf.dart';

part 'follow_ggamf_repository.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class FollowGgamfRepository {
  factory FollowGgamfRepository(Dio dio) = _FollowGgamfRepository;

  @POST("/ggamf/follow/{followingId}")
  Future<FollowGgamf> followGgamf({@Path('followingId') required int followingId, @Body() required FollowGgamf followGgamf});
}
