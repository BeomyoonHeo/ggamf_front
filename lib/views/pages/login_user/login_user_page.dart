import 'package:flutter/material.dart';

class LoginUserPage extends StatelessWidget {
  const LoginUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xffFBC5D8),
            Color.fromARGB(0, 243, 218, 153),
          ],
        )),
      ),
    );
  }
}
