import 'package:dio/dio.dart';
import 'package:ggamf_front/models/data.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://reqres.in/api') // 스프링 서버 넣어서 구동하면 됨
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/users/{id}')
  Future<User> postUser(
      {@Path()
          required int
              id}); // 추상클래스를 사용하여 retrofit 라이브러리가 알아서 Json데이터를 Object로 치환하여 Return 하여준다.

  @GET('/users')
  Future<User> getUser({@Query("page") required int page});
}
