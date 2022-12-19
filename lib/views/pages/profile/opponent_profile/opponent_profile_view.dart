import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/controller/user/opponent_profile_controller.dart';
import 'package:ggamf_front/domain/user/model/get_profile_user.dart';
import 'package:ggamf_front/domain/user/model/profile_user.dart';

import '../../../../domain/user/model/ggamf.dart';
import 'opponent_profile_view_model.dart';

class OpponentProfileView extends ConsumerStatefulWidget {
  final Ggamf ggamf;
  const OpponentProfileView({Key? key, required this.ggamf}) : super(key: key);

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
            SizedBox(
              height: MediaQuery.of(context).size.width / 2 + 95,
              child: Stack(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color.fromRGBO(35, 204, 81, 0.9), Color.fromRGBO(35, 204, 81, 1)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            tileMode: TileMode.clamp),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: CircleAvatar(
                          radius: 60.0,
                          child: ClipRRect(
                            child: widget.ggamf.photo!.isEmpty
                                ? Image.asset("assets/images/generic-avatar.svg")
                                : Image.memory((Uri.parse(opvm.photo ?? '').data!.contentAsBytes())),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            _nickName(opvm),
            SizedBox(height: 10),
            _introduce(opvm),
            SizedBox(height: 30),
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
          Text("${widget.ggamf.nickname}", style: TextStyle(color: Colors.black)),
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
      padding: EdgeInsets.all(10),
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

  Widget _ratingStarButton() {
    return ElevatedButton(
      onPressed: () {
        showDialog(context: context, builder: (_) => _ratingStar());
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(35, 204, 81, 1),
        minimumSize: const Size(150, 50),
      ),
      child: const Text("별점 주기", style: TextStyle(fontSize: 20)),
    );
  }

  Widget _followButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(35, 204, 81, 1),
        minimumSize: const Size(150, 50),
      ),
      child: const Text("팔로우하기", style: TextStyle(fontSize: 20)),
    );
  }

  Widget _introduce(GetProfileUser opvm) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: Expanded(
        child: widget.ggamf.intro!.isEmpty
            ? Text("자기소개가 없습니다")
            : Text(
                "${widget.ggamf.intro}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
      ),
    );
  }

  Widget _nickName(GetProfileUser opvm) {
    return Container(
      height: 30,
      width: double.infinity,
      child: Center(
        child: Text(
          "${widget.ggamf.nickname}",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
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
        height: 240,
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "별점주기",
              style: TextStyle(fontSize: 20),
            ),
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
                ElevatedButton(
                  onPressed: () {},
                  child: Text("별점주기", style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromRGBO(35, 204, 81, 1),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("취소", style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromRGBO(35, 204, 81, 1),
                  ),
                ),
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
          height: 330,
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
                    child: Text("리포트하기", style: TextStyle(fontSize: 20)),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromRGBO(35, 204, 81, 1),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("취소", style: TextStyle(fontSize: 20)),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromRGBO(35, 204, 81, 1),
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
