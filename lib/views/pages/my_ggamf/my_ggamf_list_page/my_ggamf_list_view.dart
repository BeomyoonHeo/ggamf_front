import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/user/model/ggamf.dart';
import 'package:ggamf_front/domain/user/model/profile_user.dart';
import 'package:ggamf_front/provider/ggamf_provider.dart';
import 'package:ggamf_front/views/pages/profile/my_profile/my_profile_view_model.dart';
import 'package:ggamf_front/views/pages/profile/opponent_profile/opponent_profile_view.dart';

import '../../../../utils/validator_util.dart';

class MyGgamfListView extends ConsumerWidget {
  const MyGgamfListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //mglv = myGgamfListViewModel
    final gp = ref.watch(ggamfProvider);
    final mpvm = ref.watch(myProfileViewModel);
    logger.d("길이보기: ${gp.length}");
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
              child: Text("내 껨프 ${gp.length}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                  backgroundImage: MemoryImage(Uri.parse(mpvm.photo ??
                          'data:image/png;base64,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')
                      .data!
                      .contentAsBytes()),
                  radius: 30,
                ) ??
                CircleAvatar(
                  backgroundImage: NetworkImage('https://picsum.photos/250/250'),
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
    return mglv.isEmpty
        ? Center(
            child: Text('내껨프가 한명도 없습니다.'),
          )
        : Expanded(
            child: ListView.separated(
              itemCount: mglv.length,
              //mglv.length,
              separatorBuilder: (context, index) => const Divider(
                height: 10,
                color: Colors.white,
              ),

              itemBuilder: (context, index) => ListTile(
                  visualDensity: VisualDensity(horizontal: 3),
                  leading: //_profileImage(),
                      CircleAvatar(
                    backgroundImage: MemoryImage(Uri.parse(mglv[index].photo ?? '').data!.contentAsBytes()),
                    radius: 30,
                  ),
                  title: Text(mglv[index].nickname, style: TextStyle(fontSize: 20)),
                  subtitle: Text(mglv[index].intro, style: TextStyle(fontSize: 15)),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => OpponentProfileView(ggamf: mglv[index])));
                  }),
            ),
          );
  }
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
