import 'package:flutter/material.dart';
import 'package:ggamf_front/views/common_components/common_bottom_navigation_bar.dart';

class RecommendGgamfList extends StatelessWidget {
  final int selectedIndex = 3;
  const RecommendGgamfList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar:
          CommonBottomNavigationBar(selectedIndex: selectedIndex),
    );
  }
}
