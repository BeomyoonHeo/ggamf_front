// 런타임시 적용되는 어노테이션과 dio의 headers가 겹쳐 dio의 headers만 import를 해제하였다.
import 'package:dio/dio.dart' hide Headers;
import 'package:ggamf_front/models/data.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(
    baseUrl:
        'https://reqres.in/api') // 스프링 서버 넣어서 구동하면 됨 - 스프링 서버 CrossOrigin 적용할 것
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/users/{id}')
  @Headers(<String, String>{
    "Content-Type": "application/json; charset=utf-8",
  })
  Future<User> postUser(
      {@Path()
          required int id,
      @Body()
          required dynamic
              body}); // 추상클래스를 사용하여 retrofit 라이브러리가 알아서 Json데이터를 Object로 치환하여 Return 하여준다.

  @GET('/users')
  Future<User> getUser({@Query("page") required int page});
}
