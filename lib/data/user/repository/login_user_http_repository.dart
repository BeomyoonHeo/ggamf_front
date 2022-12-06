import 'package:dio/dio.dart';
import 'package:ggamf_front/core/page_enum.dart';
import 'package:ggamf_front/data/user/model/login_user.dart';
import 'package:retrofit/http.dart';

part 'login_user_http_repository.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class LoginUserHttpRepository {
  factory LoginUserHttpRepository(Dio dio) = _LoginUserHttpRepository;

  @POST('/login')
  Future<dynamic> login({@Body() required LoginUser loginUser});
}
