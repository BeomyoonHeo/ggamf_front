import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ggamf_front/views/common_components/custom_icons_icons.dart';
import 'package:ggamf_front/views/pages/join_party/join_party_list/join_party_list_view.dart';
import 'package:ggamf_front/views/pages/my_ggamf/my_ggamf_list_page/my_ggamf_list_view.dart';
import 'package:ggamf_front/views/pages/my_party/my_recruitment_party_list/my_recruitment_party_list_view.dart';
import 'package:ggamf_front/views/pages/profile/my_profile/my_profile_view.dart';

import '../pages/recommend_ggamef/recommend_ggamf_list/recommend_ggamf_list_view.dart';

const List<Widget> commonPages = [
  JoinPartyListView(),
  MyRecruitmentPartyListView(),
  MyGgamfListView(),
  RecommendGgamfListView(),
  MyProfileView(),
];

class AllPages extends StatefulWidget {
  const AllPages({Key? key}) : super(key: key);

  @override
  State<AllPages> createState() => _AllPagesState();
}

class _AllPagesState extends State<AllPages> {
  List loadedPages = [2];
  int _selectedIndex = 2;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
  }

  void changeState(value) {
    setState(() {
      var pages = loadedPages;
      if (!pages.contains(value)) {
        pages.add(value);
      }
      _selectedIndex = value;
      loadedPages = pages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          loadedPages.contains(0) ? commonPages[0] : Container(),
          loadedPages.contains(1) ? commonPages[1] : Container(),
          loadedPages.contains(2) ? commonPages[2] : Container(),
          loadedPages.contains(3) ? commonPages[3] : Container(),
          loadedPages.contains(4) ? commonPages[4] : Container(),
          loadedPages.contains(5) ? commonPages[5] : Container(),
        ],
      ),
      bottomNavigationBar: _buildFlashyTabBar(),
    );
  }

  FlashyTabBar _buildFlashyTabBar() {
    return FlashyTabBar(
      animationDuration: const Duration(milliseconds: 200),
      items: <FlashyTabBarItem>[
        FlashyTabBarItem(
          icon: const Icon(CustomIcons.joinparty, size: 25),
          title: const Text('파티 참가'),
          activeColor: Colors.black,
          inactiveColor: Colors.black,
        ),
        FlashyTabBarItem(
          icon: const Icon(CustomIcons.myparty),
          title: const Text('나의 파티'),
          activeColor: Colors.black,
          inactiveColor: Colors.black,
        ),
        FlashyTabBarItem(
          icon: const Icon(CustomIcons.mygamf),
          title: const Text('내 껨프'),
          activeColor: Colors.black,
          inactiveColor: Colors.black,
        ),
        FlashyTabBarItem(
          icon: const Icon(CustomIcons.recomgamf),
          title: const Text('추천 껨프'),
          activeColor: Colors.black,
          inactiveColor: Colors.black,
        ),
        FlashyTabBarItem(
          icon: const Icon(CustomIcons.myprofile),
          title: const Text('내 프로필'),
          activeColor: Colors.black,
          inactiveColor: Colors.black,
        ),
      ],
      animationCurve: Curves.linear,
      selectedIndex: _selectedIndex,
      showElevation: true,
      onItemSelected: (value) {
        changeState(value);
      },
    );
  }
}
