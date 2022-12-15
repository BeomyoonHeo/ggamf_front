import 'package:dio/dio.dart';
import 'package:ggamf_front/utils/page_enum.dart';
import 'package:retrofit/http.dart';

import '../../user/model/ggamf.dart';
import '../model/report_ggamf.dart';

part 'my_ggamf_repository.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class MyGgamfRepository {
  factory MyGgamfRepository(Dio dio, {String baseUrl}) = _MyGgamfRepository;

  //내 껨프 목록보기
  @GET("/s/api/ggamf/user/{userId}/list")
  Future<GgamfList> myGgamfList({@Path('userId') required int userId});

  //껨프 요청
  @POST("/s/api/ggamf/follow/{followingId}")
  Future<Ggamf> followGgamf({@Path('followingId') required int followingId, @Body() required Ggamf followGgamf});

  //유저 신고
  @POST("/s/api/ggamf/user/{userId}/report/{badUserId}")
  Future<ReportGgamf> reportGgamf(
      {@Path('userId') required int userId, @Path('badUserId') required int badUserId, @Body() required ReportGgamf reportGgamf});
}
