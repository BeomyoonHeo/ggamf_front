import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/controller/user/my_profile_controller.dart';
import 'package:ggamf_front/domain/user/model/profile_user.dart';
import 'package:ggamf_front/main.dart';
import 'package:ggamf_front/views/pages/profile/my_profile/my_profile_view_model.dart';
import 'package:ggamf_front/views/pages/profile/update_my_profile/update_my_profile_view.dart';
import 'package:ggamf_front/views/pages/profile/withdrawal/withdrawal_view.dart';

class MyProfileView extends ConsumerWidget {
  const MyProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //mpvm = myProfileViewModel
    final mpvm = ref.watch(myProfileViewModel);

    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 30),
            _buildCircleAvatar(mpvm),
            SizedBox(height: 30),
            _buildNickName(mpvm),
            SizedBox(height: 10),
            _ratedStar(),
            SizedBox(height: 10),
            _buildIntro(mpvm),
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

  Container _buildIntro(ProfileUser mpvm) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
            colors: [Color.fromRGBO(202, 73, 245, 0.5), Color.fromRGBO(202, 73, 245, 0.7)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            tileMode: TileMode.clamp),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
          ),
        ],
      ),
      child: Expanded(
        child: mpvm.intro!.isEmpty
            ? Text("자기소개가 없습니다")
            : Text(
                "${mpvm.intro}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Text("내 프로필"),
    );
  }

  Widget _buildNickName(ProfileUser mpvm) {
    return Container(
      height: 50,
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
            colors: [Color.fromRGBO(202, 73, 245, 0.5), Color.fromRGBO(202, 73, 245, 0.7)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            tileMode: TileMode.clamp),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
          ),
        ],
      ),
      child: Center(
        child: Text(
          "${mpvm.nickname}",
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildCircleAvatar(mpvm) {
    return Center(
      child: CircleAvatar(
        radius: 70,
        backgroundImage: mpvm.intro!.isEmpty ? AssetImage("assets/images/generic-avatar.svg") : AssetImage("assets/images/76.jpg"),
      ),
    );
  }

  Widget _withdrawal() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          navigatorKey.currentState!.context,
          MaterialPageRoute(builder: (context) => WithdrawalView()),
        );
      },
      child: Text("탈퇴", style: TextStyle(fontSize: 20, color: Colors.white)),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        minimumSize: Size(150, 50),
        backgroundColor: Color.fromRGBO(202, 73, 245, 0.8),
      ),
    );
  }

  Widget _updataProfile() {
    return ElevatedButton(
      onPressed: () async {
        Navigator.push(
          navigatorKey.currentState!.context,
          MaterialPageRoute(builder: (context) => UpdateMyProfileView()),
        );
      },
      child: Text("프로필 수정", style: TextStyle(fontSize: 20, color: Colors.white)),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        minimumSize: Size(150, 50),
        backgroundColor: Color.fromRGBO(202, 73, 245, 0.8),
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
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
            colors: [Color.fromRGBO(202, 73, 245, 0.5), Color.fromRGBO(202, 73, 245, 0.7)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            tileMode: TileMode.clamp),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "평균별점",
            style: TextStyle(fontSize: 15, color: Colors.white),
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
