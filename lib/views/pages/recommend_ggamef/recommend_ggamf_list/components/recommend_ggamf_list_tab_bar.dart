import 'package:flutter/material.dart';

class RecommendGgamfListTabBar extends StatelessWidget {
  const RecommendGgamfListTabBar({
    Key? key,
    required TabController tabController,
    required this.textIndex,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;
  final List<String> textIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Color.fromRGBO(35, 204, 81, 0.4),
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
          color: Color.fromRGBO(35, 204, 81, 1),
        ),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black,
        tabs: [
          Tab(
            text: textIndex[0],
          ),
          Tab(
            text: textIndex[1],
          ),
        ],
      ),
    );
  }
}
