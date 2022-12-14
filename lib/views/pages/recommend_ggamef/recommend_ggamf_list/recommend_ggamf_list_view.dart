import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/views/pages/recommend_ggamef/recommend_ggamf_list/components/recommend_ggamf_list_tab_bar.dart';
import 'package:ggamf_front/views/pages/recommend_ggamef/recommend_ggamf_list/recommend_ggamf_list_view_model.dart';

import 'components/recommend_ggamf_list_tab_view.dart';

class RecommendGgamfListView extends ConsumerStatefulWidget {
  const RecommendGgamfListView({super.key});
  @override
  ConsumerState<RecommendGgamfListView> createState() => _RecommendGgamfListViewState();
}

class _RecommendGgamfListViewState extends ConsumerState<RecommendGgamfListView>
    with SingleTickerProviderStateMixin<RecommendGgamfListView>, AutomaticKeepAliveClientMixin<RecommendGgamfListView> {
  final List<String> textIndex = [
    '추천 껨프',
    '껨프 요청',
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
    return Consumer(
      builder: (context, ref, child) {
        final recommendGgamfViewModel = ref.watch(recommendGgamfListViewModel);

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              textIndex[0],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                RecommendGgamfListTabBar(tabController: _tabController, textIndex: textIndex),
                const SizedBox(height: 20),
                RecommendGgamfListTabView(
                  tabController: _tabController,
                  ggamfList: recommendGgamfViewModel,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
