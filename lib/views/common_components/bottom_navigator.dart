import 'package:flutter/material.dart';
import 'package:ggamf_front/views/common_components/custom_icons_icons.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Scaffold(
        // body: IndexedStack(
        //   index: _selectedIndex,
        //   children: [
        //     Center(child: Text("IndexedStack1")),
        //     Center(child: Text("IndexedStack2")),
        //     Center(child: Text("IndexedStack3")),
        //     Center(child: Text("IndexedStack4")),
        //     MyProfile(),
        //   ],
        // ),
        bottomNavigationBar: BottomNavigationBar(
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
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.grey[500],
          selectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
