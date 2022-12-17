import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            SizedBox(height: 70),
            _buildCircleAvatar(mpvm),
            SizedBox(height: 30),
            _buildNickName(mpvm),
            SizedBox(height: 20),
            _buildIntro(mpvm),
            SizedBox(height: 10),
            _ratedStar(),
            Container(
              height: 150,
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

  Widget _buildIntro(ProfileUser mpvm) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: Expanded(
        child: mpvm.intro!.isEmpty
            ? Text("자기소개가 없습니다")
            : Text(
                "${mpvm.intro}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: const Text("내 프로필"),
    );
  }

  Widget _buildNickName(ProfileUser mpvm) {
    return Container(
      height: 50,
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: Center(
        child: Text(
          "${mpvm.nickname}",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
    return InkWell(
      onTap: () {
        Navigator.push(
          navigatorKey.currentState!.context,
          MaterialPageRoute(builder: (context) => WithdrawalView()),
        );
      },
      child: Column(
        children: [
          Icon(
            CupertinoIcons.exclamationmark_triangle,
            size: 30,
          ),
          Text("회원 탈퇴", style: TextStyle(fontSize: 18, color: Colors.black)),
        ],
      ),
    );
  }

  Widget _updataProfile() {
    return InkWell(
      onTap: () {
        Navigator.push(
          navigatorKey.currentState!.context,
          MaterialPageRoute(builder: (context) => UpdateMyProfileView()),
        );
      },
      child: Column(
        children: [
          Icon(
            CupertinoIcons.pen,
            size: 30,
          ),
          Text("프로필 수정", style: TextStyle(fontSize: 18, color: Colors.black)),
        ],
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
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "평균별점",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(width: 20),
          _ratingBar(),
        ],
      ),
    );
  }

  Widget _ratingBar() {
    return RatingBarIndicator(
      rating: 1,
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemCount: 5,
      itemSize: 35.0,
      direction: Axis.horizontal,
    );
  }
}
