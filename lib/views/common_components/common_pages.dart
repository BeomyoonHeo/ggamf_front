import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ggamf_front/views/common_components/common_bottom_navigation_bar.dart';
import 'package:ggamf_front/views/pages/join_party/join_party_list/join_party_list.dart';
import 'package:ggamf_front/views/pages/my_ggamf/my_ggamf_list_page/my_ggamf_list_page.dart';
import 'package:ggamf_front/views/pages/my_party/create_party/create_party_page.dart';
import 'package:ggamf_front/views/pages/profile/my_profile/my_profile_page.dart';
import 'package:ggamf_front/views/pages/recommend_ggamef/recommend_ggamf_list/recommend_ggamf_list.dart';

List<Widget> commonPages = [
  const CreatePartyPage(),
  const JoinPartyList(),
  const MyGgamfListPage(),
  const RecommendGgamfList(),
  const MyProfilePage(),
];

class AllPages extends StatefulWidget {
  const AllPages({Key? key}) : super(key: key);

  @override
  State<AllPages> createState() => _AllPagesState();
}

class _AllPagesState extends State<AllPages> {
  int _selectedIndex = 3;

  void changeState(value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: commonPages.elementAt(_selectedIndex),
      bottomNavigationBar: CommonBottomNavigationBar(
          selectedIndex: _selectedIndex, widgetState: changeState),
    );
  }
}
