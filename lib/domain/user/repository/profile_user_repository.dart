import 'package:dio/dio.dart';
import 'package:ggamf_front/domain/user/model/profile_user.dart';
import 'package:retrofit/http.dart';

part 'profile_user_repository.g.dart';

@RestApi(baseUrl: 'https://reqres.in/api')
abstract class ProfileUserRepository {
  factory ProfileUserRepository(Dio dio) = _ProfileUserRepository;

  @GET('/profileUser/{id}')
  Future<ProfileUser> getUserProfile({@Path('id') required int id});

  @PUT('/profileUser/{id}')
  Future<ProfileUser> putUserProfile({@Path('id') required int id, @Body() required ProfileUser profileUser});
}
