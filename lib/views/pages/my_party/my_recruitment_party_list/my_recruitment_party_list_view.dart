import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ggamf_front/views/pages/my_party/create_party/create_party_view.dart';
import 'package:ggamf_front/views/pages/my_party/my_recruitment_party_list/components/my_recruitment_party_list_tab_bar.dart';
import 'package:ggamf_front/views/pages/my_party/my_recruitment_party_list/components/my_recruitment_party_list_tab_view.dart';

class MyRecruitmentPartyListView extends StatefulWidget {
  const MyRecruitmentPartyListView({Key? key}) : super(key: key);

  @override
  State<MyRecruitmentPartyListView> createState() => _MyRecruitmentPartyListViewState();
}

class _MyRecruitmentPartyListViewState extends State<MyRecruitmentPartyListView>
    with SingleTickerProviderStateMixin<MyRecruitmentPartyListView>, AutomaticKeepAliveClientMixin<MyRecruitmentPartyListView> {
  final List<String> textIndex = [
    '나의 파티',
    '참가중인 방',
  ];
  late TabController _tabController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(textIndex[0]),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePartyView()));
            },
            icon: Icon(
              FontAwesomeIcons.personCirclePlus,
              color: Colors.black,
              size: 25,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            MyRecruitmentPartyListTabBar(tabController: _tabController, textIndex: textIndex),
            const SizedBox(height: 20),
            MyRecruitmentPartyListTabView(tabController: _tabController),
          ],
        ),
      ),
    );
  }
}
