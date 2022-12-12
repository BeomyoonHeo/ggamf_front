import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../core/page_enum.dart';
import '../model/withdraw_user.dart';

part 'withdraw_user_repository.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class WithdrawUserRepository {
  factory WithdrawUserRepository(Dio dio) = _WithdrawUserRepository;

  @PUT("/user/{userId}/withdraw")
  Future<WithdrawUser> withdrawUser({@Path('userId') required int userId, @Body() required WithdrawUser withdrawUser});
}
