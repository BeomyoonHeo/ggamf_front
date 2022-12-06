import 'package:flutter/material.dart';
import 'package:ggamf_front/core/page_enum.dart';
import 'package:ggamf_front/core/theme.dart';
import 'package:ggamf_front/views/common_components/common_pages.dart';
import 'package:ggamf_front/views/pages/administrator/administrator_page.dart';
import 'package:ggamf_front/views/pages/join_user/join_user_page.dart';
import 'package:ggamf_front/views/pages/login_user/login_user_page.dart';

void main() {
  runApp(AdministratorPage());
}

// 페이지 context를 global로 가지고 있을 NavigatorKey 적용
final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: const AllPages(),
      initialRoute: PageEnum.getByDisPlayName('login').requestLocation,
      routes: {
        PageEnum.LOGIN.requestLocation: (context) => const LoginUserPage(),
        PageEnum.JOIN.requestLocation: (context) => JoinUserPage(),
        PageEnum.ALLPAGES.requestLocation: (context) => const AllPages(),
      },
      theme: theme(),
    );
  }
}
