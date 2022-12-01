import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:ggamf_front/views/common_components/custom_icons_icons.dart';

class CommonBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final Function widgetState;
  const CommonBottomNavigationBar(
      {Key? key, required this.selectedIndex, required this.widgetState})
      : super(key: key);

  @override
  State<CommonBottomNavigationBar> createState() =>
      _CommonBottomNavigationBarState(
          selectedIndex: selectedIndex, widgetState: widgetState);
}

class _CommonBottomNavigationBarState extends State<CommonBottomNavigationBar> {
  int selectedIndex;
  Function widgetState;
  _CommonBottomNavigationBarState(
      {required this.selectedIndex, required this.widgetState});

  @override
  Widget build(BuildContext context) {
    return FlashyTabBar(
      items: <FlashyTabBarItem>[
        FlashyTabBarItem(
          icon: Icon(CustomIcons.joinparty, size: 25),
          title: Text('파티참가'),
        ),
        FlashyTabBarItem(
          icon: Icon(CustomIcons.myparty),
          title: Text('나의 파티'),
        ),
        FlashyTabBarItem(
          icon: Icon(CustomIcons.mygamf),
          title: Text('내 껨프'),
        ),
        FlashyTabBarItem(
          icon: Icon(CustomIcons.recomgamf),
          title: Text('추천 껨프'),
        ),
        FlashyTabBarItem(
          icon: Icon(CustomIcons.myprofile),
          title: Text('내 프로필'),
        ),
      ],
      animationCurve: Curves.linear,
      selectedIndex: selectedIndex,
      showElevation: true,
      onItemSelected: (value) {
        setState(() {
          widgetState(value);
          selectedIndex = value;
        });
      },
    );
  }
}
