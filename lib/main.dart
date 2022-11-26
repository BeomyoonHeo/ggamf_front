import 'package:flutter/material.dart';

import 'package:ggamf_front/views/pages/login_user/login_user_page.dart';
void main() {
  runApp(const MyApp());
}

// 페이지 context를 global로 가지고 있을 NavigatorKey 적용
final naviagtorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: naviagtorKey,
      home: LoginUserPage(),
      routes: {},
    );
  }
}
