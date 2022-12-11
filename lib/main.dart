import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ggamf_front/core/page_enum.dart';
import 'package:ggamf_front/core/theme.dart';
import 'package:ggamf_front/utils/full_screen_util.dart';
import 'package:ggamf_front/views/common_components/common_pages.dart';
import 'package:ggamf_front/views/pages/join_user/join_user_view.dart';
import 'package:ggamf_front/views/pages/login_user/login_user_view.dart';
import 'package:ggamf_front/views/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]); //세로화면 고정
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
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
  static FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  dynamic jwtToken;
  late final fullScreen;
  @override
  void initState() {
    fullScreen = FullscreenService();
    secureStorage.read(key: 'jwtToken').then((value) => jwtToken = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      initialRoute: jwtToken != null
          ? PageEnum.ALLPAGES.requestLocation
          : PageEnum.getByDisPlayName('login').requestLocation,
      routes: {
        PageEnum.LOGIN.requestLocation: (context) => const LoginUserView(),
        PageEnum.JOIN.requestLocation: (context) => const JoinUserView(),
        PageEnum.ALLPAGES.requestLocation: (context) => const AllPages(),
      },
      theme: theme(),
    );
  }
}
