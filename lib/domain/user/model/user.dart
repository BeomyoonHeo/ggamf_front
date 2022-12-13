import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
<<<<<<< HEAD
=======
import 'package:ggamf_front/domain/user/model/login_user.dart';
>>>>>>> 9b58e789a63d3905d42e1e1344a52e04f39573b0
import 'package:ggamf_front/utils/validator_util.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:jwt_decode/jwt_decode.dart';

part 'user.g.dart';

const storage = FlutterSecureStorage();

@JsonSerializable()
class User {
  final int id;
  final String? username;
  final String? backgroundImage;
  final String? name;
  final String? intro;

  User({
    required this.username,
    required this.id,
    required this.backgroundImage,
    required this.name,
    required this.intro,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

class UserSession {
  static LoginUser? _user;
  static String? _jwtToken;
  static bool _isLogin = false;

  static get user => _user;
  static get jwtToken => _jwtToken;
  static get isLogin => _isLogin;

<<<<<<< HEAD
  static void successAuthentication(User? userParam, String jwtToken) {
=======
  static void successAuthentication(LoginUser? userParam, String jwtToken) {
>>>>>>> 9b58e789a63d3905d42e1e1344a52e04f39573b0
    _user = userParam;
    _isLogin = true;
    _jwtToken = jwtToken;
    logger.d('로그인 ? ${_isLogin}');
  }

  static Future<void> removeAuthentication() async {
    storage.delete(key: 'jwtToken').then((value) {
      _user = null;
      _jwtToken = null;
      _isLogin = false;
    });
  }

  static void setJwtTokenHeader(Headers headers) {
    storage.read(key: 'jwtToken').then((value) {
      storage
          .write(
              key: 'jwtToken',
              value: headers.value('Authorization')?.replaceAll('Bearer ', ''))
          .then((value) {
        _jwtToken = headers.value('Authorization')?.replaceAll('Bearer ', '');
        logger.d(_jwtToken);
        Map<String, dynamic> userInfo = Jwt.parseJwt(_jwtToken!);
      });
    });
  }

  static Map<String, dynamic>? getJwtTokenHeader(Map<String, dynamic> headers) {
    return UserSession._jwtToken != null
        ? {...headers, 'Authorization': UserSession._jwtToken}
        : headers;
  }
}
