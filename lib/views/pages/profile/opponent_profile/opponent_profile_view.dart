import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/controller/user/opponent_profile_controller.dart';
import 'package:ggamf_front/domain/user/model/get_profile_user.dart';
import 'package:ggamf_front/domain/user/model/profile_user.dart';

import 'opponent_profile_view_model.dart';

class OpponentProfileView extends ConsumerStatefulWidget {
  const OpponentProfileView({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _OpponentProfileViewState();
}

class _OpponentProfileViewState extends ConsumerState<OpponentProfileView> {
  final List<String> _valueList = ['욕설', '비방', '광고', '괴롭힘', '기타'];
  var _selectedValue;

  //final int userId;

  //_OpponentProfileViewState(this.userId);

  @override
  Widget build(BuildContext context) {
    //opvm = opponentProfileViewModel
    final opvm = ref.watch(opponentProfileViewModel);

    return Scaffold(
      appBar: _appbar(opvm),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 50),
            _buildCircleAvatar(opvm),
            SizedBox(height: 50),
            _nickName(opvm),
            SizedBox(height: 30),
            _ratedStar(),
            SizedBox(height: 30),
            _introduce(opvm),
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
                _followButton(),
                _ratingStarButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleAvatar(GetProfileUser opvm) {
    return Center(
      child: CircleAvatar(
        radius: 70,
        backgroundImage: AssetImage("assets/images/41.jpg"),
      ),
    );
  }

  AppBar _appbar(GetProfileUser opvm) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          BackButton(
            color: Colors.black,
          ),
          Text("${opvm.nickname}", style: TextStyle(color: Colors.black)),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            showDialog(context: context, builder: (_) => _reportPage());
          },
          icon: Icon(Icons.error_outline, size: 40),
          color: Colors.red,
        ),
        SizedBox(width: 15),
      ],
    );
  }

  Widget _ratedStar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1),
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

  Widget _ratingStarButton() {
    return OutlinedButton(
      onPressed: () {
        showDialog(context: context, builder: (_) => _ratingStar());
      },
      child: Text("별점 주기", style: TextStyle(fontSize: 20)),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        minimumSize: Size(150, 50),
      ),
    );
  }

  Widget _followButton() {
    return OutlinedButton(
      onPressed: () {},
      child: Text("팔로우하기", style: TextStyle(fontSize: 20)),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        minimumSize: Size(150, 50),
      ),
    );
  }

  Widget _introduce(GetProfileUser opvm) {
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
          "${opvm.intro}",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
      ),
    );
  }

  Widget _nickName(GetProfileUser opvm) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Text(
        "${opvm.nickname}",
        style: TextStyle(fontSize: 15, color: Colors.black),
        textAlign: TextAlign.center,
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

  Widget _ratingStar() {
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

  Widget _reportPage() {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: double.infinity,
          height: 400,
          child: Column(
            children: [
              Text(
                ("신고하기"),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: '악성 유저 이름',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              DropdownButton(
                hint: Text("신고사유"),
                value: _selectedValue,
                isExpanded: true,
                items: _valueList.map((String item) {
                  return DropdownMenuItem<String>(
                    child: Text('$item'),
                    value: item,
                  );
                }).toList(),
                onChanged: (dynamic value) {
                  setState(
                    () {
                      _selectedValue = value;
                    },
                  );
                },
              ),
              SizedBox(height: 20),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  minLines: 1,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: '상세내용',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("리포트하기"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      side: BorderSide(width: 1),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("취소"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      side: BorderSide(width: 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
