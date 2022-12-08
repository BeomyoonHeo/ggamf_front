import 'package:dio/dio.dart' hide Headers;
import 'package:ggamf_front/domain/data.dart';
import 'package:ggamf_front/domain/recommend_ggamf_list/model/recommend_ggamf_list.dart';
import 'package:retrofit/retrofit.dart';

part 'recommend_ggamf_list_repository.g.dart';

@RestApi(
    baseUrl:
        'https://reqres.in/api') // 스프링 서버 넣어서 구동하면 됨 - 스프링 서버 CrossOrigin 적용할 것
abstract class RecommendGgamfListRepository {
  factory RecommendGgamfListRepository(Dio dio, {String baseUrl}) =
      _RecommendGgamfListRepository;

  @POST('/users/{id}')
  @Headers(<String, String>{
    "Content-Type": "application/json; charset=utf-8",
  })
  Future<User> postUser(
      {@Path() required int id, @Body() required dynamic body});

  @GET('/users')
  Future<RecommendGgamfList> getUser({@Path("page") required int page});
}
