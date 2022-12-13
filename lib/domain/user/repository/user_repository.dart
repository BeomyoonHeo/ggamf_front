import 'package:dio/dio.dart';
import 'package:ggamf_front/domain/user/model/join_user.dart';
import 'package:ggamf_front/domain/user/model/login_user.dart';
import 'package:ggamf_front/domain/user/model/profile_user.dart';
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
        UserSession.successAuthentication(null, value);
      }
    });
  }
}

@RestApi(baseUrl: baseUrl)
abstract class RecommendGgamfListRepository {
  factory RecommendGgamfListRepository(Dio dio, {String baseUrl}) =
      _RecommendGgamfListRepository;

  @POST('/users/{id}')
  Future<User> postUser(
      {@Path() required int id, @Body() required dynamic body});

  //추천 겜프 리스트 불러오기
  @GET('/s/api/ggamf/users/{id}/recommend')
  Future<User> getUserList({@Path("id") required int id});

  // 겜프 요청하기
  @POST('/s/api/ggamf/{id}/follow/{followUserId}')
  Future<dynamic> requestGgmf(
      {@Path('id') required int id,
      @Path('followUserId') required int followUserId});

  //겜프 요청 수락하기
  @PUT('/s/api/ggamf/user/{id}/accept/{followUserId}')
  Future<dynamic> acceptGgamf(
      {@Path('id') required int id,
      @Path('followUserId') required int followUserId});
}

@RestApi(baseUrl: baseUrl)
abstract class ProfileUserRepository {
  factory ProfileUserRepository(Dio dio, {String baseUrl}) =
      _ProfileUserRepository;

  @GET("/s/api/user/{userId}/detail")
  Future<dynamic> getUserProfile({@Path('userId') required int userId});

  @PUT("/s/api/user/{userId}/update")
  Future<dynamic> putUserProfile(
      {@Path('userId') required int userId,
      @Body() required UpdateUser updateUser});
}
