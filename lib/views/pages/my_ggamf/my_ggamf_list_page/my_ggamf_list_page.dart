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
        padding: const EdgeInsets.only(right: 5, left: 5, top: 20),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/rgb.gif"),
                ),
                // gradient: LinearGradient(
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                //   colors: [
                //     Color(0xffFBC5D8),
                //     Color.fromARGB(0, 243, 218, 153),
                //   ],
                // ),
                border: Border.all(width: 1),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(255, 255, 255, 0.75),
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
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/rgbround.gif"),
                ),
                // gradient: LinearGradient(
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                //   colors: [
                //     Color(0xffFBC5D8),
                //     Color.fromARGB(0, 243, 218, 153),
                //   ],
                // ),
                border: Border.all(width: 1),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(255, 255, 255, 0.75),
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
                        backgroundImage: AssetImage("assets/images/20.jpg"),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Text(
                              "홍길동",
                              style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "가나다라마바사아자차카타파하",
                              style: TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/sunset.gif"),
                ),
                // gradient: LinearGradient(
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                //   colors: [
                //     Color(0xffFBC5D8),
                //     Color.fromARGB(0, 243, 218, 153),
                //   ],
                // ),
                border: Border.all(width: 1),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(255, 255, 255, 0.75),
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
                        backgroundImage: AssetImage("assets/images/41.jpg"),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Text(
                              "홍무당",
                              style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "마하반야다라밀다심경 공즉시색 색즉시공",
                              style: TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/sakura.gif"),
                ),
                // gradient: LinearGradient(
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                //   colors: [
                //     Color(0xffFBC5D8),
                //     Color.fromARGB(0, 243, 218, 153),
                //   ],
                // ),
                border: Border.all(width: 1),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(255, 255, 255, 0.75),
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
                        backgroundImage: AssetImage("assets/images/20.jpg"),
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
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/rgb.gif"),
                ),
                // gradient: LinearGradient(
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                //   colors: [
                //     Color(0xffFBC5D8),
                //     Color.fromARGB(0, 243, 218, 153),
                //   ],
                // ),
                border: Border.all(width: 1),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(255, 255, 255, 0.75),
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
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/rgb.gif"),
                ),
                // gradient: LinearGradient(
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                //   colors: [
                //     Color(0xffFBC5D8),
                //     Color.fromARGB(0, 243, 218, 153),
                //   ],
                // ),
                border: Border.all(width: 1),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(255, 255, 255, 0.75),
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
            ),
          ],
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
