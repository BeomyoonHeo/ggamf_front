import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/ggamf.dart';
import 'package:ggamf_front/utils/validator_util.dart';
import 'package:ggamf_front/views/pages/my_ggamf/my_ggamf_list_page/my_ggamf_list_view_model.dart';
import 'package:ggamf_front/views/pages/profile/opponent_profile/opponent_profile_view.dart';

class MyGgamfListView extends ConsumerWidget {
  const MyGgamfListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //mglv = myGgamfListViewModel
    final mglv = ref.watch(myGgamfListViewModel);
    logger.d("길이보기: ${mglv.length}");
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(right: 5, left: 5, top: 20),
        child: ListView.builder(
          itemCount: mglv.length,
          itemBuilder: (context, index) => Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/rgb.gif"),
              ),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OpponentProfileView()));
                },
                child: Row(
                  children: [
                    _profileImage(),
                    SizedBox(width: 20),
                    _context(mglv, index),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _context(List<Ggamf> mglv, index) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5),
          Text(
            "${mglv[index].nickname}",
            //"김겐지",
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10),
          Text(
            "${mglv[index].intro}",
            //"안녕하세요",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

CircleAvatar _profileImage() {
  return CircleAvatar(
    radius: 40,
    backgroundImage: AssetImage(
      //_myGgamfList[index].photo,
      "assets/images/76.jpg",
    ),
  );
}

AppBar _appBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    title: Text(
      "내 껨프",
      style: TextStyle(
          color: Colors.black, fontFamily: 'NanumSquare', fontSize: 25),
    ),
    elevation: 0,
  );
}
