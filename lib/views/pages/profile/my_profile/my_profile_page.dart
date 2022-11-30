import 'package:flutter/material.dart';
import 'package:ggamf_front/views/common_components/common_bottom_navigation_bar.dart';

import '../../../../core/color.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            SizedBox(height: 50),
            _buildCircleAvatar(),
            SizedBox(height: 50),
            _nickName(),
            SizedBox(height: 30),
            _introduce(),
            Container(
              height: 150,
              child: InkWell(
                onTap: () async {
                  await showDialog(
                      context: context, builder: (_) => _imageDialog());
                },
                child: Image.asset("assets/images/cart1.png"),
              ),
            ),
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
      bottomNavigationBar: CommonBottomNavigationBar(
          selectedIndex: _selectedIndex, state: _onItemTapped),
    );
  }

  Widget _buildCircleAvatar() {
    return Center(
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
        backgroundColor: kSecondaryColor,
      ),
    );
  }

  Widget _updataProfile() {
    return ElevatedButton(
      onPressed: () {},
      child: Text("프로필 수정"),
      style: ElevatedButton.styleFrom(
        backgroundColor: kSecondaryColor,
      ),
    );
  }

  Widget _introduce() {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            blurRadius: 5,
            spreadRadius: 0,
            offset: Offset(5, 6),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Text(
        "리그오브레전드 원딜 탑레 다이아 1 같이 듀오하실 서폿분 구합니다",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15, color: Colors.black),
      ),
    );
  }

  Widget _nickName() {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            blurRadius: 5,
            spreadRadius: 0,
            offset: Offset(5, 6),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Text(
        "닉네임",
        style: TextStyle(fontSize: 15, color: Colors.black),
        textAlign: TextAlign.center,
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
