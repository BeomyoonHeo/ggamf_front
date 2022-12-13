import 'package:dio/dio.dart';
import 'package:ggamf_front/core/page_enum.dart';
import 'package:ggamf_front/domain/user/model/profile_user.dart';
import 'package:ggamf_front/domain/user/model/withdraw_user.dart';
import 'package:retrofit/http.dart';

part 'profile_user_repository.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ProfileUserRepository {
  factory ProfileUserRepository(Dio dio) = _ProfileUserRepository;

  //유저 상세보기
  @GET("/s/api/user/{userId}/detail")
  Future<ProfileUser> getUserProfile({@Path('userId') required int id});

  //유저 정보 수정하기
  @PUT("/s/api/user/{userId}/update")
  Future<ProfileUser> putUserProfile({@Path('userId') required int id, @Body() required ProfileUser profileUser});

  //탈퇴하기
  @PUT("/s/api/user/{userId}/withdraw")
  Future<WithdrawUser> withdrawUser({@Path('userId') required int userId, @Body() required WithdrawUser withdrawUser});
}
