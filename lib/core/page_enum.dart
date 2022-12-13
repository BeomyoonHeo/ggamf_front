const String baseUrl = 'http://183.104.199.106:8080';
const headers = {"Content-Type": "application/json; charset=utf-8"};

enum PageEnum {
  BASEURL(null, 'http://localhost:8080', 'baseUrl'),
  LOGIN(1, '/login', 'login'),
  JOIN(null, '/join', 'join'),
  RECOMMENDGGAMF(3, '/recommendGamf', 'recommendGamf'),
  MYPROFILE(4, '/myProfile', 'myProfile'),
  UNDEFINED(null, 'undefined', ''),
  ALLPAGES(null, '/allpages', 'allpages');

  const PageEnum(this.navigatorCode, this.requestLocation, this.displayName);
  final int? navigatorCode;
  final String requestLocation;
  final String displayName;

  factory PageEnum.getByCode(int navigatorCode) {
    return PageEnum.values.firstWhere((value) => value.navigatorCode == navigatorCode, orElse: () => PageEnum.UNDEFINED);
  }

  factory PageEnum.getByDisPlayName(String displayName) {
    return PageEnum.values.firstWhere((value) => value.displayName == displayName, orElse: () => PageEnum.UNDEFINED);
  }
}
