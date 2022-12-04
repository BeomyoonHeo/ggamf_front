import 'package:flutter/material.dart';

class ManageRoom extends StatelessWidget {
  const ManageRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Container(
              height: size.height * 0.5,
              color: Colors.black,
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
