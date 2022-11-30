enum PageEnum {
  LOGIN(1, '/login', 'login'),
  JOIN(null, '/join', 'join'),
  RECOMMENDGGAMF(3, '/recommendGamf', 'recommendGamf'),
  MYPROFILE(4, '/myProfile', 'myProfile'),
  UNDEFINED(null, 'undefined', '');

  const PageEnum(this.code, this.requestLocation, this.displayName);
  final int? code;
  final String requestLocation;
  final String displayName;

  factory PageEnum.getByCode(int code) {
    return PageEnum.values.firstWhere((value) => value.code == code,
        orElse: () => PageEnum.UNDEFINED);
  }

  factory PageEnum.getByDisPlayName(String displayName) {
    return PageEnum.values.firstWhere(
        (value) => value.displayName == displayName,
        orElse: () => PageEnum.UNDEFINED);
  }
}
