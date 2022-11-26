import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ggamf_front/core/color.dart';
import 'package:ggamf_front/views/pages/login_user/components/RoundedInputField.dart';
import 'package:ggamf_front/views/pages/login_user/components/login_screen_decoration.dart';
import 'package:ggamf_front/views/pages/login_user/components/rounded_input_password_field.dart';

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
                    '매칭해줘! 껨프',
                    style: TextStyle(fontFamily: 'NanumSquare', fontSize: 40),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      color: Colors.white,
                      width: size.width * 0.9,
                      height: size.height * 0.3 + 20,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(9)),
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            child: Column(
                              children: [
                                RoundedInputField(
                                  icon: Icons.person,
                                  hintText: "아이디입력",
                                  onChanged: (value) {},
                                ),
                                SizedBox(height: 10),
                                RoundedInputPasswordField(
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "로그인",
                                style: TextStyle(color: Colors.black),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        kPrimaryColor),
                                shape: MaterialStatePropertyAll<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
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
