import 'package:dio/dio.dart';
import 'package:ggamf_front/core/page_enum.dart';
import 'package:ggamf_front/domain/user/model/join_user.dart';
import 'package:retrofit/http.dart';

part 'join_user_repository.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class JoinUserRepository {
  factory JoinUserRepository(Dio dio) = _JoinUserRepository;

  @POST('/s/api/join')
  Future<dynamic> insert(@Body() JoinUser joinUser);
}
