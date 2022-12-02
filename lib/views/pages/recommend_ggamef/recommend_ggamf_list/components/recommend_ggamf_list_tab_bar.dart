import 'package:flutter/material.dart';

class RecommendGgamfListTabBar extends StatefulWidget {
  const RecommendGgamfListTabBar({
    Key? key,
    required TabController tabController,
    required this.textIndex,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;
  final List<String> textIndex;

  @override
  State<RecommendGgamfListTabBar> createState() =>
      _RecommendGgamfListTabBarState();
}

class _RecommendGgamfListTabBarState extends State<RecommendGgamfListTabBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(
          25.0,
        ),
      ),
      child: TabBar(
        controller: widget._tabController,
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
          Tab(
            text: widget.textIndex[0],
          ),
          Tab(
            text: widget.textIndex[1],
          ),
        ],
      ),
    );
  }
}
