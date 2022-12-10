import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ggamf_front/core/page_enum.dart';
import 'package:ggamf_front/core/theme.dart';
import 'package:ggamf_front/views/common_components/common_pages.dart';
import 'package:ggamf_front/views/pages/join_user/join_user_view.dart';
import 'package:ggamf_front/views/pages/login_user/login_user_view.dart';
import 'package:ggamf_front/views/pages/splash_page.dart';

void main() async {
  runApp(SplashPage(
    key: UniqueKey(),
    onInitializationComplete: () {
      runApp(const ProviderScope(child: MyApp()));
    },
  ));
}

// 페이지 context를 global로 가지고 있을 NavigatorKey 적용
final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static final secureStorage = FlutterSecureStorage();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: const AllPages(),
      initialRoute: PageEnum.getByDisPlayName('login').requestLocation,
      routes: {
        PageEnum.LOGIN.requestLocation: (context) => const LoginUserView(),
        PageEnum.JOIN.requestLocation: (context) => const JoinUserView(),
        PageEnum.ALLPAGES.requestLocation: (context) => const AllPages(),
      },
      theme: theme(),
    );
  }
}
