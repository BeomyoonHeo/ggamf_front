import 'package:dio/dio.dart';
import 'package:ggamf_front/models/data.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://reqres.in/api')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/users/{id}')
  Future<User> postUser({@Path() required int id});

  @GET('/users')
  Future<User> getUser({@Query("page") required int page});
}
