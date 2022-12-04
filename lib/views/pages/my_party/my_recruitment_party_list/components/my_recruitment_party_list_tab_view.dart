import 'package:flutter/material.dart';

class MyRecruitmentPartyListTabView extends StatefulWidget {
  const MyRecruitmentPartyListTabView({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  State<MyRecruitmentPartyListTabView> createState() =>
      _MyRecruitmentPartyListTabViewState();
}

class _MyRecruitmentPartyListTabViewState
    extends State<MyRecruitmentPartyListTabView>
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
    return Expanded(
      child: TabBarView(
        controller: widget._tabController,
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.amber,
                ),
                child: Text(
                  "나의 모집 파티",
                  style: TextStyle(fontSize: 30),
                ),
                alignment: Alignment.center,
              ),
              SizedBox(height: 20),
              Container(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("게임이름 : 리그오브 레전드"),
                            SizedBox(height: 20),
                            Text("방 제목 : 롤 골드 자랭하실분 구합니다"),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Text("방장이름 : 김겐지"),
                                SizedBox(width: 70),
                                Text("2/5"),
                              ],
                            ),
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
            ],
          ),
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.amber,
                ),
                child: Text(
                  "내가 참가 중인 방",
                  style: TextStyle(fontSize: 30),
                ),
                alignment: Alignment.center,
              ),
              SizedBox(height: 20),
              Container(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("게임이름 : 리그오브 레전드"),
                            SizedBox(height: 20),
                            Text("방 제목 : 롤 골드 자랭하실분 구합니다"),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Text("방장이름 : 김겐지"),
                                SizedBox(width: 70),
                                Text("2/5"),
                              ],
                            ),
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
              SizedBox(height: 20),
              Container(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("게임이름 : 로스트아크"),
                            SizedBox(height: 20),
                            Text("방 제목 : 공격대 파티 구합니다"),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Text("방장이름 : 김겐지"),
                                SizedBox(width: 70),
                                Text("2/4"),
                              ],
                            ),
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
