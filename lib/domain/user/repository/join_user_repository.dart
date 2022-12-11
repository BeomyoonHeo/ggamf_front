import 'package:dio/dio.dart';
import 'package:ggamf_front/domain/user/model/join_user.dart';
import 'package:retrofit/http.dart';

import '../../../utils/page_enum.dart';

part 'join_user_repository.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class JoinUserRepository {
  factory JoinUserRepository(Dio dio) = _JoinUserRepository;

  @PUT('/user/join')
  Future<dynamic> insert(@Body() JoinUser joinUser);
}
