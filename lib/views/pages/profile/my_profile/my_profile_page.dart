import 'package:flutter/material.dart';
import 'package:ggamf_front/views/pages/profile/components/profileContext.dart';

import '../../../../core/color.dart';
import '../update_my_profile/update_my_profile_page.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  int _selectedIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          padding: EdgeInsets.only(top: 40),
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                ProfileContext(
                  nickname: "김겐지",
                  intro: "안녕하세요",
                  img: "assets/images/rgb.gif",
                ),
                _backCircle(),
                _buildCircleAvatar(),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 200,
              child: InkWell(
                onTap: () async {
                  await showDialog(context: context, builder: (_) => _imageDialog());
                },
                child: Image.asset("assets/images/cart1.png"),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _updataProfile(),
                _withdrawal(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _backCircle() {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xffFBC5D8),
            Color.fromARGB(0, 243, 218, 153),
          ],
        ),
      ),
    );
  }

  // Widget _profileContext() {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 100),
  //     child: Container(
  //       padding: EdgeInsets.all(10),
  //       width: double.infinity,
  //       height: 200,
  //       decoration: BoxDecoration(
  //         gradient: LinearGradient(
  //           begin: Alignment.topLeft,
  //           end: Alignment.bottomRight,
  //           colors: [
  //             Color(0xffFBC5D8),
  //             Color.fromARGB(0, 243, 218, 153),
  //           ],
  //         ),
  //       ),
  //       child: Column(
  //         children: [
  //           SizedBox(height: 60),
  //           Text(
  //             "김겐지",
  //             style: TextStyle(fontFamily: 'NanumSquare', fontSize: 20),
  //           ),
  //           SizedBox(height: 30),
  //           Text(
  //             "자기소개뭐우런ㅇ루랑ㄹㅇsdsfsdfdsfsfsfsdfdsfsdfsfsdfsdfdsfsdfsdfdsfsdsddsfsfdsdfsfssd",
  //             style: TextStyle(fontFamily: 'NanumSquare', fontSize: 16),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildCircleAvatar() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: CircleAvatar(
        radius: 70,
        backgroundImage: AssetImage("assets/images/76.jpg"),
      ),
    );
  }

  Widget _withdrawal() {
    return ElevatedButton(
      onPressed: () {},
      child: Text("탈퇴"),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.white,
        textStyle: TextStyle(fontFamily: 'NanumSquare', fontSize: 20),
        foregroundColor: Colors.black,
        side: BorderSide(),
      ),
    );
  }

  Widget _updataProfile() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const UpdateMyProfile()),
        );
      },
      child: Text("프로필 수정"),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.white,
        textStyle: TextStyle(fontFamily: 'NanumSquare', fontSize: 20),
        foregroundColor: Colors.black,
        side: BorderSide(),
      ),
    );
  }
}

Widget _imageDialog() {
  return Dialog(
    child: Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/cart2.png')),
      ),
    ),
  );
}

AppBar _appBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    title: Text(
      "내 프로필",
      style: TextStyle(color: Colors.black, fontFamily: 'NanumSquare', fontSize: 25),
    ),
    elevation: 0,
  );
}
