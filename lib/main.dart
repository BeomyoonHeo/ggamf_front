import 'package:flutter/material.dart';
import 'package:ggamf_front/core/page_enum.dart';
import 'package:ggamf_front/views/pages/join_user/join_user_page.dart';
import 'package:ggamf_front/views/pages/login_user/login_user_page.dart';
import 'package:ggamf_front/views/pages/profile/my_profile/my_profile_page.dart';
import 'package:ggamf_front/views/pages/recommend_ggamef/recommend_ggamf_list/recommend_ggamf_list.dart';

void main() {
  runApp(MyApp());
}

// 페이지 context를 global로 가지고 있을 NavigatorKey 적용
final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: RecommendGgamfList(),
      routes: {
        PageEnum.getByDisPlayName('login').requestLocation: (context) =>
            LoginUserPage(),
        PageEnum.getByDisPlayName('join').requestLocation: (context) =>
            JoinUserPage(),
        PageEnum.getByDisPlayName('myProfile').requestLocation: (context) =>
            MyProfilePage(),
        PageEnum.getByDisPlayName('recommendGamf').requestLocation: (context) =>
            RecommendGgamfList(),
      },
    );
  }
}
