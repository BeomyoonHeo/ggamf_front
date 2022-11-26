import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ggamf_front/views/pages/login_user/components/login_box.dart';
import 'package:ggamf_front/views/pages/login_user/components/login_screen_decoration.dart';

class LoginUserPage extends StatelessWidget {
  const LoginUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: loginScreenDecoration(),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/login_logo_icon.svg',
                        height: 130,
                      ),
                      const Text(
                        '매칭해줘! 껨프',
                        style:
                            TextStyle(fontFamily: 'NanumSquare', fontSize: 25),
                      ),
                      const SizedBox(height: 10),
                      LoginBox(size: size),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Text(
                      "다른 계정으로 가입하기!",
                      style: TextStyle(fontFamily: 'NanumSquare'),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialIcon(socialIcon: 'assets/icons/kakaotalk.svg'),
                      SocialIcon(socialIcon: 'assets/icons/google_plus.svg'),
                      SocialIcon(
                          socialIcon: 'assets/icons/apple_logo_black.svg'),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final socialIcon;
  const SocialIcon({
    Key? key,
    this.socialIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        socialIcon,
        width: 20,
        height: 20,
      ),
    );
  }
}
