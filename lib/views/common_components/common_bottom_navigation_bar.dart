import 'package:flutter/material.dart';
import 'package:ggamf_front/views/common_components/custom_icons_icons.dart';

BottomNavigationBar CommonBottomNavigationBar(
    {required int selectedIndex, required Function state}) {
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
      state(value);
    },
  );
}
