import 'package:flutter/material.dart';
import 'package:ggamf_front/views/pages/profile/opponent_profile/opponent_profile_page.dart';

import '../../../common_components/custom_icons_icons.dart';

class MyGgamfListPage extends StatefulWidget {
  const MyGgamfListPage({Key? key}) : super(key: key);

  @override
  State<MyGgamfListPage> createState() => _MyGgamfListPageState();
}

class _MyGgamfListPageState extends State<MyGgamfListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(right: 30, left: 30),
        child: ListView(
          children: [
            SizedBox(height: 40),
            _ggamfList(),
            SizedBox(height: 40),
            _ggamfList(),
            SizedBox(height: 40),
            _ggamfList(),
            SizedBox(height: 40),
            _ggamfList(),
            SizedBox(height: 40),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Container _ggamfList() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        // image: DecorationImage(
        //   fit: BoxFit.cover,
        //   image: AssetImage("assets/images/rgb.gif"),
        // ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xffFBC5D8),
            Color.fromARGB(0, 243, 218, 153),
          ],
        ),
        border: Border.all(width: 1),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        height: 120,
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => OpponentProfile()));
          },
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("assets/images/76.jpg"),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      "김겐지",
                      style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "나는 오늘밤 사냥에 나선다아dkkkkkkkkkkkkkkkkkkk",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Text(
        "내 껨프",
        style: TextStyle(color: Colors.black, fontFamily: 'NanumSquare', fontSize: 25),
      ),
      elevation: 0,
    );
  }
}
