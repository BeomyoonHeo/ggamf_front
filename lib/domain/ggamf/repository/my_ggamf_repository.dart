import 'package:dio/dio.dart';
import 'package:ggamf_front/domain/user/model/ggamf.dart';
import 'package:ggamf_front/utils/page_enum.dart';
import 'package:retrofit/http.dart';

import '../model/report_ggamf.dart';
import '../model/unfollow_ggamf.dart';

part 'my_ggamf_repository.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class MyGgamfRepository {
  factory MyGgamfRepository(Dio dio) = _MyGgamfRepository;

  //내 껨프 목록보기
  @GET("/s/api/ggamf/user/{userId}/list")
  Future<Ggamf> myGgamf({@Path('userId') required int userId});

  //껨프 요청
  @POST("/s/api/ggamf/follow/{followingId}")
  Future<Ggamf> followGgamf(
      {@Path('followingId') required int followingId,
      @Body() required Ggamf followGgamf});

  //껨프 거절
  @DELETE("/s/api/ggamf/user/{userId}/unfollow/{followId}")
  Future<Ggamf> rejectGgamf(
      {@Path('followId') required int followId,
      @Path('userId') required int userId});

  //껨프 삭제
  @DELETE("/s/api/ggamf/user/{userId}/unfollow/{followId}")
  Future<UnfollowGgamf> deleteGgamf(
      {@Path('followId') required int followId,
      @Path('userId') required int userId});

  //껨프 요청 취소
  @DELETE("/s/api/ggamf/user/{userId}/cancel/{followId}")
  Future<Ggamf> cancelGgamf(
      {@Path('followId') required int followId,
      @Path('userId') required int userId});

  //껨프 요청 수락
  @PUT("/s/api/ggamf/user/{userId}/accept/{followId}")
  Future<Ggamf> acceptGgamf(
      {@Path('followId') required int followId,
      @Path('userId') required int userId,
      @Body() required Ggamf acceptGgamf});

  //유저 신고
  @POST("/s/api/ggamf/user/{userId}/report/{badUserId}")
  Future<ReportGgamf> reportGgamf(
      {@Path('userId') required int userId,
      @Path('badUserId') required int badUserId,
      @Body() required ReportGgamf reportGgamf});
}
