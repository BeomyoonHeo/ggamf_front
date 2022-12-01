import 'package:flutter/material.dart';

class RecommendGgamfList extends StatefulWidget {
  const RecommendGgamfList({Key? key}) : super(key: key);

  @override
  State<RecommendGgamfList> createState() => _RecommendGgamfListState();
}

class _RecommendGgamfListState extends State<RecommendGgamfList>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          child: TabBar(controller: _tabController, tabs: [
            Container(
              height: 80,
              child: Text('추천 껨프'),
            ),
            Container(
              height: 80,
              child: Text('껨프 요청'),
            ),
          ]),
        ),
        Expanded(
            child: TabBarView(
          controller: _tabController,
          children: [
            Container(
              color: Colors.yellow[200],
              alignment: Alignment.center,
              child: Text(
                'Tab1 View',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              color: Colors.green[200],
              alignment: Alignment.center,
              child: Text(
                'Tab2 View',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ))
      ]),
    );
  }
}
