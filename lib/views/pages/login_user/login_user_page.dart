import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ggamf_front/views/pages/login_user/components/login_screen_decoration.dart';
import 'package:ggamf_front/views/pages/login_user/components/text_field_container.dart';

class LoginUserPage extends StatelessWidget {
  const LoginUserPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: loginScreenDecoration(),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/login_logo_icon.svg',
                    height: 200,
                  ),
                  const Text(
                    '심심할땐? 껨프',
                    style: TextStyle(fontFamily: 'NanumSquare', fontSize: 40),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      color: Colors.white,
                      width: size.width * 0.8,
                      height: size.height * 0.3,
                      child: Column(
                        children: [
                          TextFieldContainer(
                            child: TextField(
                              decoration: InputDecoration(icon: Icons.person),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
