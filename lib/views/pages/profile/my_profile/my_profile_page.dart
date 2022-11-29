import 'package:flutter/material.dart';

import '../../../../core/color.dart';
import '../../../common_components/bottom_navigator.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              _buildCircleAvatar(),
              SizedBox(height: 50),
              _nickName(),
              SizedBox(height: 20),
              _introduce(),
              SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  await showDialog(context: context, builder: (_) => _imageDialog());
                },
                child: Image.asset("assets/images/cart1.png"),
              ),
              SizedBox(height: 50),
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
      ),
      bottomNavigationBar: BottomNavigator(),
    );
  }

  CircleAvatar _buildCircleAvatar() {
    return CircleAvatar(
      radius: 70,
      backgroundImage: AssetImage("assets/images/20.jpg"),
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
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(15),
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
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.all(10),
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
