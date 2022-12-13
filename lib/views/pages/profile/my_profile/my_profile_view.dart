import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/controller/user/my_profile_controller.dart';
import 'package:ggamf_front/main.dart';
import 'package:ggamf_front/views/pages/profile/my_profile/my_profile_view_model.dart';
import 'package:ggamf_front/views/pages/profile/update_my_profile/update_my_profile_view.dart';
import 'package:ggamf_front/views/pages/profile/withdrawal/withdrawal_view.dart';

class MyProfileView extends ConsumerWidget {
  const MyProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // //mpc = myProfileController
    // final mpc = ref.read(myProfileController);
    //mpvm = myProfileViewModel
    final mpvm = ref.watch(myProfileViewModel);

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
            _buildCircleAvatar(mpvm),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Text(
                "${mpvm.nickname}",
                style: TextStyle(fontSize: 15, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            _ratedStar(),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Expanded(
                child: Text(
                  "${mpvm.intro}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
            ),
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

  Widget _buildCircleAvatar(mpvm) {
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
          navigatorKey.currentState!.context,
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
      onPressed: () async {
        Navigator.push(
          navigatorKey.currentState!.context,
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

//   Widget _nickName(MyProfileViewModel mpvm) {
//     return
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
}
