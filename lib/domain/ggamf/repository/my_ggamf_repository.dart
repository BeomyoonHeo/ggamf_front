import 'package:dio/dio.dart';
import 'package:ggamf_front/core/page_enum.dart';
import 'package:ggamf_front/domain/ggamf/model/my_ggamf.dart';
import 'package:retrofit/http.dart';

part 'my_ggamf_repository.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class MyGgamfRepository {
  factory MyGgamfRepository(Dio dio) = _MyGgamfRepository;

  @GET("ggamf/list")
  Future<MyGgamf> myGgamf({@Query('page') required int page});
}
