import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ggamf_front/views/pages/profile/update_my_profile/update_my_profile_view.dart';
import 'package:ggamf_front/views/pages/profile/withdrawal/withdrawal_view.dart';

import '../../../../core/color.dart';

class MyProfileView extends StatefulWidget {
  const MyProfileView({Key? key}) : super(key: key);

  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text("내 프로필"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 30),
            _buildCircleAvatar(),
            SizedBox(height: 30),
            _nickName(),
            SizedBox(height: 10),
            _ratedStar(),
            SizedBox(height: 10),
            _introduce(),
            Container(
              height: 150,
              child: InkWell(
                onTap: () async {
                  await showDialog(context: context, builder: (_) => _imageDialog());
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
    return OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WithdrawalView()),
        );
      },
      child: Text("탈퇴"),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        minimumSize: Size(150, 50),
      ),
    );
  }

  Widget _updataProfile() {
    return OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UpdateMyProfileView()),
        );
      },
      child: Text("프로필 수정"),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        minimumSize: Size(150, 50),
      ),
    );
  }

  Widget _introduce() {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Expanded(
        child: Text(
          "리그오브레전드 원딜 탑레 다이아 1 같이 듀오하실 서폿분 구합니다",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
      ),
    );
  }

  Widget _nickName() {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
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

Widget _ratedStar() {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      border: Border.all(width: 1),
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "평균별점",
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
        SizedBox(width: 20),
        _ratingBar(),
      ],
    ),
  );
}

Widget _ratingBar() {
  return RatingBarIndicator(
    rating: 1,
    itemBuilder: (context, index) => Icon(
      Icons.star,
      color: Colors.amber,
    ),
    itemCount: 5,
    itemSize: 35.0,
    direction: Axis.horizontal,
  );
}
