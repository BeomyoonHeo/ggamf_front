import 'package:flutter/material.dart';
import 'package:ggamf_front/core/page_enum.dart';
import 'package:ggamf_front/views/common_components/custom_icons_icons.dart';

class CommonBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  const CommonBottomNavigationBar({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  State<CommonBottomNavigationBar> createState() =>
      _CommonBottomNavigationBarState(selectedIndex);
}

class _CommonBottomNavigationBarState extends State<CommonBottomNavigationBar> {
  int selectedIndex;
  _CommonBottomNavigationBarState(this.selectedIndex);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(CustomIcons.joinparty, size: 25),
          label: '파티참가',
        ),
        BottomNavigationBarItem(
          icon: Icon(CustomIcons.myparty),
          label: '나의 파티',
        ),
        BottomNavigationBarItem(
          icon: Icon(CustomIcons.mygamf),
          label: '내 껨프',
        ),
        BottomNavigationBarItem(
          icon: Icon(CustomIcons.recomgamf),
          label: '추천 껨프',
        ),
        BottomNavigationBarItem(
          icon: Icon(CustomIcons.myprofile),
          label: '내 프로필',
        ),
      ],
      currentIndex: selectedIndex,
      unselectedItemColor: Colors.grey[500],
      selectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      onTap: (value) {
        setState(() {
          selectedIndex = value;
          Navigator.popAndPushNamed(
              context, PageEnum.getByCode(value).requestLocation);
        });
      },
    );
  }
}
