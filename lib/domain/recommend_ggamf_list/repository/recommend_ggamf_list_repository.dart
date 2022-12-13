// 런타임시 적용되는 어노테이션과 dio의 headers가 겹쳐 dio의 headers만 import를 해제하였다.
import 'package:dio/dio.dart' hide Headers;
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:retrofit/retrofit.dart';

part 'recommend_ggamf_list_repository.g.dart';

@RestApi(
    baseUrl:
        'https://reqres.in/api') // 스프링 서버 넣어서 구동하면 됨 - 스프링 서버 CrossOrigin 적용할 것
abstract class RecommendGgamfListRepository {
  factory RecommendGgamfListRepository(Dio dio,
          {String baseUrl}) = // factory 키워드를 사용하여 싱글톤 패턴으로 구현 및
      _RecommendGgamfListRepository; //이후 추상 클래스 내부의 CRUD메서드를 호출 할 수 있게 해주는 유일한 수단이다.

  @POST('/users/{id}')
  @Headers(<String, String>{
    "Content-Type": "application/json; charset=utf-8",
  })
  Future<User> postUser(
      {@Path() required int id, @Body() required dynamic body});

  @GET('/users')
  Future<User> getUser({@Query("page") required int page});
}
