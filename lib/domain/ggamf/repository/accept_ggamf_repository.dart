import 'package:dio/dio.dart';
import 'package:ggamf_front/core/page_enum.dart';
import 'package:ggamf_front/domain/ggamf/model/accept_ggamf.dart';
import 'package:retrofit/http.dart';

part 'accept_ggamf_repository.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class AcceptGgamfRepository {
  factory AcceptGgamfRepository(Dio dio) = _AcceptGgamfRepository;

  @PUT("/ggamf/accept/{followId}")
  Future<AcceptGgamf> acceptGgamf({@Path('followId') required int followId, @Body() required AcceptGgamf acceptGgamf});
}
