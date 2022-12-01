import 'package:flutter/material.dart';

class RecommendGgamfList extends StatefulWidget {
  const RecommendGgamfList({super.key});
  @override
  _RecommendGgamfListState createState() => _RecommendGgamfListState();
}

class _RecommendGgamfListState extends State<RecommendGgamfList>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          '추천 껨프',
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // give the tab bar a height [can change hheight to preferred height]
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: Colors.black,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: '추천 껨프',
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: '껨프 요청',
                  ),
                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // first tab bar view widget
                  Center(
                    child: Text(
                      '추천 껨프',
                      style: TextStyle(fontSize: 25, fontFamily: 'NanumSquare'),
                    ),
                  ),

                  // second tab bar view widget
                  Center(
                    child: Text(
                      '껨프 요청',
                      style: TextStyle(fontSize: 25, fontFamily: 'NanumSquare'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
