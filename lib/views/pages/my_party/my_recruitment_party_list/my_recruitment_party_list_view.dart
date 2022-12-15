import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ggamf_front/views/pages/my_party/create_party/create_party_view.dart';
import 'package:ggamf_front/views/pages/my_party/my_recruitment_party_list/components/my_recruitment_party_list_tab_bar.dart';
import 'package:ggamf_front/views/pages/my_party/my_recruitment_party_list/components/my_recruitment_party_list_tab_view.dart';
import 'package:ggamf_front/views/pages/my_party/my_recruitment_party_list/my_recruitment_party_list_view_model.dart';

class MyRecruitmentPartyListView extends ConsumerStatefulWidget {
  const MyRecruitmentPartyListView({Key? key}) : super(key: key);

  @override
  ConsumerState<MyRecruitmentPartyListView> createState() => _MyRecruitmentPartyListViewState();
}

class _MyRecruitmentPartyListViewState extends ConsumerState<MyRecruitmentPartyListView>
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
    final mrplv = ref.watch(myRecruitmentPartyListViewModel);
    return Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            MyRecruitmentPartyListTabBar(tabController: _tabController, textIndex: textIndex),
            const SizedBox(height: 20),
            MyRecruitmentPartyListTabView(tabController: _tabController, myRoomList: mrplv),
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(textIndex[0]),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePartyView()));
          },
          icon: Icon(
            FontAwesomeIcons.userPlus,
            color: Colors.black,
            size: 25,
          ),
        ),
      ],
    );
  }
}
