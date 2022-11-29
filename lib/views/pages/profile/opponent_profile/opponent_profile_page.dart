import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/color.dart';
import '../../../common_components/bottom_navigator.dart';

class OpponentProfilePage extends StatelessWidget {
  const OpponentProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
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
              _ratedStar(),
              SizedBox(height: 20),
              _introduce(),
              SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  await showDialog(context: context, builder: (_) => _imageDialog());
                },
                child: Image.asset("assets/images/cart1.png"),
              ),
              SizedBox(height: 20),
              _followButton(),
              SizedBox(height: 20),
              _ratingStarButton(context),
              SizedBox(height: 20),
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
      backgroundImage: AssetImage("assets/images/41.jpg"),
    );
  }

  AppBar _appbar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        children: [
          BackButton(
            color: Colors.black,
          ),
          Text("김겐지", style: TextStyle(color: Colors.black)),
        ],
      ),
      actions: [
        Icon(
          Icons.report_gmailerrorred,
          color: Colors.red,
          size: 40,
        ),
        SizedBox(width: 15),
      ],
    );
  }

  Container _ratedStar() {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            blurRadius: 5,
            spreadRadius: 0,
            offset: Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
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

  ElevatedButton _ratingStarButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(context: context, builder: (_) => _ratingStar(context));
      },
      child: Text("별점 주기"),
      style: ElevatedButton.styleFrom(backgroundColor: kSecondaryColor),
    );
  }

  ElevatedButton _followButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text("팔로우하기"),
      style: ElevatedButton.styleFrom(backgroundColor: kSecondaryColor),
    );
  }

  Widget _introduce() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            blurRadius: 5,
            spreadRadius: 0,
            offset: Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
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
            offset: Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Text(
        "김겐지",
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }
}

Widget _ratingBar() {
  return RatingBarIndicator(
    rating: 2.75,
    itemBuilder: (context, index) => Icon(
      Icons.star,
      color: Colors.amber,
    ),
    itemCount: 5,
    itemSize: 40.0,
    direction: Axis.horizontal,
  );
}

// class ImageDialog extends StatelessWidget {
//   const ImageDialog({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: Container(
//         width: 300,
//         height: 200,
//         decoration: BoxDecoration(
//           image: DecorationImage(image: AssetImage('assets/images/cart2.png')),
//         ),
//       ),
//     );
//   }
// }

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

Widget _ratingStar(context) {
  return Dialog(
    child: Container(
      padding: EdgeInsets.all(20),
      width: 350,
      height: 250,
      child: Column(
        children: [
          SizedBox(height: 20),
          Text("별점주기"),
          SizedBox(height: 20),
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: () {}, child: Text("별점쾅!")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("취소")),
            ],
          )
        ],
      ),
    ),
  );
}
