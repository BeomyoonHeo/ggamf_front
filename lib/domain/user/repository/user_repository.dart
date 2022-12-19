import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:ggamf_front/domain/user/model/ggamf.dart';
import 'package:ggamf_front/domain/user/model/join_user.dart';
import 'package:ggamf_front/domain/user/model/login_user.dart';
import 'package:ggamf_front/domain/user/model/update_user.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/utils/validator_util.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:retrofit/http.dart';

import '../../../utils/page_enum.dart';

part 'user_repository.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class UserRepository {
  factory UserRepository(Dio dio) = _UserRepository;

  @POST('/s/api/join')
  Future<dynamic> insert({@Body() required JoinUser joinUser});

  @POST('/login')
  Future<dynamic> login({@Body() required LoginUser loginUser});
}

class Session {
  Future<void> getInitSession() async {
    storage.read(key: 'jwtToken').then((value) {
      if (value != null) {
        Map<String, dynamic> jwtData = Jwt.parseJwt(value);
        logger.d('객체 확인 : ${jwtData}');
        UserSession.successAuthentication(User.fromJson(jwtData), value);
      }
    });
  }
}

@RestApi(baseUrl: baseUrl)
abstract class GgamfRepository {
  factory GgamfRepository(Dio dio, {String baseUrl}) = _GgamfRepository;

  //내 껨프 목록보기
  @GET("/s/api/ggamf/user/{userId}/list")
  Future<GgamfList> myGgamfList({@Path('userId') required int userId});

  //받은 껨프 요청 수락하기
  @PUT('/s/api/ggamf/user/{id}/accept/{targetId}')
  Future<dynamic> acceptReceiveGgmaf({@Path('id') required int id, @Path('targetId') required int targetId});

  //받은 껨프 요청 무시하기
  @DELETE('/s/api/ggamf/user/{id}/reject/{targetId}')
  Future<dynamic> denyReceiveGgamf({@Path('id') required int id, @Path('targetId') required int targetId});

  //보낸 껨프 요청 취소하기
  @DELETE('/s/api/ggamf/user/{id}/cancel/{targetId}')
  Future<dynamic> cancelSendGgamf({@Path('id') required int id, @Path('targetId') required int targetId});

  //추천 겜프 리스트 불러오기
  @GET('/s/api/ggamf/user/{id}/recommend')
  Future<GgamfList> getRecommendGgamfList({@Path("id") required int id});

  //보낸 겜프 요청 목록 보기
  @GET('/s/api/ggamf/user/{id}/sendggamf')
  Future<GgamfList> getSendGgamfList({@Path('id') required int id});

  //받은 겜프 요청 목록 보기
  @GET('/s/api/ggamf/user/{id}/receiveggamf')
  Future<GgamfList> getReceiveggamfList({@Path('id') required int id});

  // 겜프 요청하기
  @POST('/s/api/ggamf/user/{id}/follow/{followUserId}')
  Future<dynamic> requestGgmf({@Path('id') required int id, @Path('followUserId') required int followUserId});

  //겜프 요청 수락하기
  @PUT('/s/api/ggamf/user/{id}/accept/{followUserId}')
  Future<dynamic> acceptGgamf({@Path('id') required int id, @Path('followUserId') required int followUserId});

  //겜프 취소하기
  @DELETE('/s/api/ggamf/user/{userId}/unfollow/{friendId}')
  Future<dynamic> deleteGgamf({@Path('userId') required int userId, @Path('friendId') required int friendId});

  //회원 탈퇴
  @PUT('/s/api/{userId}/withdraw')
  Future<dynamic> withdraw({@Path('userId') required int userId});
}

@RestApi(baseUrl: baseUrl)
abstract class ProfileUserRepository {
  factory ProfileUserRepository(Dio dio, {String baseUrl}) = _ProfileUserRepository;

  @GET("/s/api/user/{userId}/detail")
  Future<dynamic> getUserProfile({@Path('userId') required int userId});

  @PUT("/s/api/user/{userId}/update")
  Future<dynamic> putUserProfile({@Path('userId') required int userId, @Body() required UpdateUser updateUser});
}
