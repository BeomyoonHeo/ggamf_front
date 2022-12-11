import 'package:dio/dio.dart';
import 'package:ggamf_front/core/page_enum.dart';
import 'package:ggamf_front/domain/ggamf/model/accept_ggamf.dart';
import 'package:ggamf_front/domain/ggamf/model/report_ggamf.dart';
import 'package:retrofit/http.dart';

part 'report_ggamf_repository.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ReportGgamfRepository {
  factory ReportGgamfRepository(Dio dio) = _ReportGgamfRepository;

  @POST("ggamf/user/{userId}/report/{badUserId}")
  Future<ReportGgamf> acceptGgamf(
      {@Path('userId') required int userId, @Path('badUserId') required int badUserId, @Body() required ReportGgamf reportGgamf});
}
