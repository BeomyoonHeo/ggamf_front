import 'package:dio/dio.dart';
import 'package:ggamf_front/core/page_enum.dart';
import 'package:ggamf_front/domain/user/model/join_user.dart';
import 'package:ggamf_front/domain/user/model/login_user.dart';
import 'package:retrofit/http.dart';

part 'user_repository.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class UserRepository {
  factory UserRepository(Dio dio) = _UserRepository;

  @POST('/s/api/join')
  Future<dynamic> insert({@Body() required JoinUser joinUser});

  @POST('/s/api/login')
  Future<dynamic> login({@Body() required LoginUser loginUser});
}

class UserSession {
  Future<Response> getInitSession(String path, String? jwtToken) async {
    Map<String, String> requestHeader = {
      ...headers,
      "Authorization": jwtToken!
    };

    Response response = await Dio().get('/s/api/user',
        options: Options(
          headers: requestHeader,
        ));
    return response;
  }
}
