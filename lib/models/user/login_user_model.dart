class LoginUserModel {
  final String loginId;
  final String password;

  LoginUserModel({required this.loginId, required this.password});

  Map<String, dynamic> toJson() => {
        'loginId': loginId,
        'password': password,
      };
  factory LoginUserModel.fromJson(Map<String, dynamic> json) => LoginUserModel(
        loginId: json['loginId'],
        password: json['password'],
      );
}
