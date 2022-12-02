import 'package:flutter/material.dart';
import 'package:ggamf_front/core/page_enum.dart';
import 'package:ggamf_front/views/common_components/common_pages.dart';
import 'package:ggamf_front/views/pages/join_user/join_user_page.dart';
import 'package:ggamf_front/views/pages/login_user/login_user_page.dart';

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
      home: AllPages(),
      initialRoute: PageEnum.getByDisPlayName('login').requestLocation,
      routes: {
        PageEnum.getByDisPlayName('login').requestLocation: (context) =>
            const LoginUserPage(),
        PageEnum.getByDisPlayName('join').requestLocation: (context) =>
            const JoinUserPage(),
        PageEnum.getByDisPlayName('allpages').requestLocation: (context) =>
            const AllPages(),
      },
      theme: ThemeData(
        fontFamily: 'NanumSquare',
        backgroundColor: Color(0xFFFFFBFE),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(elevation: MaterialStatePropertyAll(0))),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(fontSize: 25, color: Colors.black),
        ),
      ),
    );
  }
}
