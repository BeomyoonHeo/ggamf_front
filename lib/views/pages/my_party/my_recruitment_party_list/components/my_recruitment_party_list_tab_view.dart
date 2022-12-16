import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/controller/party/party_controller.dart';
import 'package:ggamf_front/views/pages/my_party/my_recruitment_party_list/joining_party_list_view_model.dart';
import 'package:ggamf_front/views/pages/my_party/my_recruitment_party_list/my_recruitment_party_list_view_model.dart';

import '../../../../../domain/party/model/my_room.dart';

class MyRecruitmentPartyListTabView extends ConsumerStatefulWidget {
  const MyRecruitmentPartyListTabView({
    Key? key,
    required TabController tabController,
    required List<MyRoom> myRoomList,
  })  : _tabController = tabController,
        _myRoomList = myRoomList,
        super(key: key);

  final TabController _tabController;
  final List<MyRoom> _myRoomList;

  @override
  ConsumerState<MyRecruitmentPartyListTabView> createState() =>
      _MyRecruitmentPartyListTabViewState();
}

class _MyRecruitmentPartyListTabViewState
    extends ConsumerState<MyRecruitmentPartyListTabView>
    with SingleTickerProviderStateMixin<MyRecruitmentPartyListTabView> {
  late final TabController _innerTabController;

  final List<String> textIndex = [
    '나의 파티',
    '참가중인 방',
  ];

  @override
  void initState() {
    _innerTabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: ((BuildContext context, WidgetRef ref, Widget? child) {
        final mrplv = ref.watch(myRecruitmentPartyListViewModel);
        final jplvm = ref.watch(joiningPartyListViewModel);
        return Expanded(
          child: TabBarView(
            controller: widget._tabController,
            children: [
              _buildMyRecruitmentPartyListTabView(mrplv, ref),
              _buildJoiningPartyListView(jplvm, ref),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildJoiningPartyListView(List<MyRoom> jplvm, WidgetRef ref) {
    return jplvm.isEmpty
        ? Center(
            child: Text('파티창이 없습니다.'),
          )
        : ListView.separated(
            itemCount: jplvm.length,
            separatorBuilder: (context, index) => Divider(
              height: 20,
              color: Colors.white,
            ),
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(width: 1),
              ),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Text("방 제목 : 롤 골드 자랭하실분 구합니다"),
                          Text("방 제목 : ${jplvm[index].roomName}"),
                          SizedBox(height: 10),
                          Text("방장이름 : ${jplvm[index].nickName}"),
                          SizedBox(height: 10),
                          Text("인원 : ${jplvm[index].totalPeople} 명"),
                        ],
                      ),
                    ),
                    SizedBox(width: 30),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        "assets/images/lol.png",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  Widget _buildMyRecruitmentPartyListTabView(
      List<MyRoom> mrplv, WidgetRef ref) {
    final pc = ref.read(partyController);
    return mrplv.isEmpty
        ? Center(
            child: Text('파티창이 없습니다.'),
          )
        : ListView.separated(
            itemCount: mrplv.length,
            separatorBuilder: (context, index) => const Divider(
              height: 20,
              color: Colors.white,
            ),
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(width: 1),
              ),
              child: InkWell(
                onTap: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (_) => ChattingView()));
                  pc.enterParty(roomId: mrplv[index].id);
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Text("방 제목 : 롤 골드 자랭하실분 구합니다"),
                          Text("방 제목 : ${mrplv[index].roomName}"),
                          SizedBox(height: 10),
                          Text("방장이름 : ${mrplv[index].nickName}"),
                          SizedBox(height: 10),
                          Text("인원 : ${mrplv[index].totalPeople} 명"),
                        ],
                      ),
                    ),
                    SizedBox(width: 30),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        "assets/images/lol.png",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
