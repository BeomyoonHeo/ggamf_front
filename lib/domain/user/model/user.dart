import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

const storage = FlutterSecureStorage();

@JsonSerializable()
class User {
  final String backgroundImage;
  final String name;
  final String intro;

  User({
    required this.backgroundImage,
    required this.name,
    required this.intro,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

class UserSession {
  static User? _user;
  static String? _jwtToken;
  static bool _isLogin = false;

  static get user => _user;
  static get jwtToken => _jwtToken;
  static get isLogin => _isLogin;

  static void successAuthentication(User userParam, String jwtToken) {
    _user = userParam;
    _isLogin = true;
    _jwtToken = jwtToken;
  }

  static Future<void> removeAuthentication() async {
    _user = null;
    _jwtToken = null;
    _isLogin = false;
  }

  static Map<String, String> getJwtTokenHeader(Map<String, String> headers) {
    return UserSession._jwtToken == null
        ? headers
        : {...headers, "Authorization": UserSession._jwtToken!};
  }
}
