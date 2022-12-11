import 'package:dio/dio.dart';
import 'package:ggamf_front/core/page_enum.dart';
import 'package:ggamf_front/domain/user/model/profile_user.dart';
import 'package:retrofit/http.dart';

part 'profile_user_repository.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ProfileUserRepository {
  factory ProfileUserRepository(Dio dio) = _ProfileUserRepository;

  @GET("/user/{userId}/detail")
  Future<ProfileUser> getUserProfile({@Path('userId') required int id});

  @PUT("/user/{userId}/update")
  Future<ProfileUser> putUserProfile({@Path('userId') required int id, @Body() required ProfileUser profileUser});
}
