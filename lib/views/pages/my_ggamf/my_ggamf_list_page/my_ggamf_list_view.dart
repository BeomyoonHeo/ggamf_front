import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/ggamf.dart';
import 'package:ggamf_front/domain/user/model/profile_user.dart';
import 'package:ggamf_front/provider/ggamf_provider.dart';
import 'package:ggamf_front/views/pages/profile/my_profile/my_profile_view.dart';
import 'package:ggamf_front/views/pages/profile/my_profile/my_profile_view_model.dart';
import 'package:ggamf_front/views/pages/profile/opponent_profile/opponent_profile_view.dart';

class MyGgamfListView extends ConsumerWidget {
  const MyGgamfListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //mglv = myGgamfListViewModel
    final gp = ref.watch(ggamfProvider);
    final mpvm = ref.watch(myProfileViewModel);
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _myprofile(mpvm),
            const SizedBox(height: 5),
            Divider(height: 1.5, color: Colors.grey[800], endIndent: 8),
            const SizedBox(height: 5),
            Container(
              padding: EdgeInsets.all(15),
              child: Text("내 껨프 3", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              //Text("내 껨프 ${gp.length}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            _buildMyGgamfList(gp),
          ],
        ),
      ),
    );
  }

  InkWell _myprofile(ProfileUser mpvm) {
    return InkWell(
      onTap: () {
        //Navigator.popAndPushNamed(context, '/myProfile');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        width: double.infinity,
        height: 80,
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: MemoryImage(Uri.parse(mpvm.photo ?? '').data!.contentAsBytes()),
              radius: 30,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${mpvm.nickname}", style: const TextStyle(fontSize: 22)),
                Text("${mpvm.intro}", style: const TextStyle(fontSize: 17)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMyGgamfList(List<Ggamf> mglv) {
    return
        // mglv.isEmpty
        //   ? Center(
        //       child: Text('내껨프가 한명도 없습니다.'),
        //     )
        //   :
        Expanded(
      child: ListView.separated(
        itemCount: 3,
        separatorBuilder: (context, index) => const Divider(
          height: 10,
          color: Colors.white,
        ),
        //mglv.length,
        itemBuilder: (context, index) => ListTile(
          visualDensity: VisualDensity(horizontal: 3),
          leading: _profileImage(),
          //CircleAvatar(
          //   backgroundImage: MemoryImage(Uri.parse(mglv[index].photo ?? '').data!.contentAsBytes()),
          //   radius: 30,
          // ),
          title: Text(
            "김겐지",
            style: TextStyle(fontSize: 20),
          ), //
          subtitle: Text(
            "안녕하세요 잘가세요",
            style: TextStyle(fontSize: 15),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => OpponentProfileView()));
          },
        ),
        //     Container(
        //   padding: EdgeInsets.all(10),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(5),
        //     gradient: LinearGradient(
        //         colors: [Color.fromRGBO(202, 73, 245, 0.5), Color.fromRGBO(202, 73, 245, 0.7)],
        //         begin: Alignment.centerLeft,
        //         end: Alignment.centerRight,
        //         tileMode: TileMode.clamp),
        //     boxShadow: [
        //       BoxShadow(
        //         color: Colors.purple.withOpacity(0.2),
        //         spreadRadius: 5,
        //         blurRadius: 7,
        //       ),
        //     ],
        //   ),
        //   height: 120,
        //   child: InkWell(
        //     onTap: () {
        //       Navigator.push(context, MaterialPageRoute(builder: (context) => OpponentProfileView()));
        //     },
        //     child: Row(
        //       children: [
        //         _profileImage(),
        //         SizedBox(width: 20),
        //         _context(mglv, index),
        //       ],
        //     ),
        //   ),
        // ),
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
            //"${mglv[index].nickname}",
            "김겐지",
            style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10),
          Text(
            //"${mglv[index].intro}",
            "안녕하세요",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

Widget _profileImage() {
  return CircleAvatar(
    backgroundImage: AssetImage(
      "assets/images/76.jpg",
    ),
    radius: 30,
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
