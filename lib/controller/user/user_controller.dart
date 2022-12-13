import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/login_user.dart';
import 'package:ggamf_front/domain/user/repository/user_repository.dart';
import 'package:ggamf_front/utils/validator_util.dart';

final userController = Provider((ref) => UserController());

class UserController {
  final userRepository = UserRepository(Dio());
  login(String username, String password) {
    final loginUser = LoginUser(loginId: username, password: password);
    userRepository.login(loginUser: loginUser).then((value) => ).onError((error, stackTrace) => null);
  }
}
