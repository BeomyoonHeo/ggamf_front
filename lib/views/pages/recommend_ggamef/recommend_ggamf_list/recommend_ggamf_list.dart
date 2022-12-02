import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ggamf_front/views/pages/recommend_ggamef/recommend_ggamf_list/components/recommend_ggamf_list_tab_bar.dart';

import 'components/recommend_ggamf_list_tab_view.dart';

class RecommendGgamfList extends StatefulWidget {
  const RecommendGgamfList({super.key});
  @override
  State<RecommendGgamfList> createState() => _RecommendGgamfListState();
}

class _RecommendGgamfListState extends State<RecommendGgamfList>
    with SingleTickerProviderStateMixin {
  final List<String> textIndex = [
    '추천 껨프',
    '껨프 요청',
  ];
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
    print('외부 컨트롤러 ${_tabController}');
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            textIndex[_tabController.index],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              RecommendGgamfListTabBar(
                  tabController: _tabController, textIndex: textIndex),
              const SizedBox(height: 20),
              RecommendGgamfListTabView(tabController: _tabController),
            ],
          ),
        ),
      ),
    );
  }
}
