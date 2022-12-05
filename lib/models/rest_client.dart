import 'package:dio/dio.dart';
import 'package:ggamf_front/models/user/join_user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://reqres.in/api')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/users/{id}')
  Future<JoinUserModel> getUser({@Path() required int id});
}
