import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/views/pages/recommend_ggamef/recommend_ggamf_list/components/recommend_ggamf_list_tab_bar.dart';
import 'package:ggamf_front/views/pages/recommend_ggamef/recommend_ggamf_list/receive_ggamf_list_view_model.dart';
import 'package:ggamf_front/views/pages/recommend_ggamef/recommend_ggamf_list/send_ggamf_list_view_model.dart';

import '../../../../../domain/user/model/user.dart';

class RecommendGgamfListTabView extends StatefulWidget {
  const RecommendGgamfListTabView({
    Key? key,
    required TabController tabController,
    required List<User> ggamfList,
  })  : _tabController = tabController,
        _ggamfList = ggamfList,
        super(key: key);

  final TabController _tabController;
  final List<User> _ggamfList;
  @override
  State<RecommendGgamfListTabView> createState() =>
      _RecommendGgamfListTabViewState();
}

class _RecommendGgamfListTabViewState extends State<RecommendGgamfListTabView>
    with SingleTickerProviderStateMixin<RecommendGgamfListTabView> {
  late final TabController _innerTabController;

  final List<String> textIndex = [
    '받은 껨프 요청',
    '보낸 껨프 요청',
  ];

  final List<IconButton> buttonListToReceiveRequestGgamf = [
    IconButton(
      onPressed: () {},
      icon: Icon(CupertinoIcons.person_badge_plus_fill),
    ),
    IconButton(
      onPressed: () {},
      icon: Icon(Icons.delete),
    ),
  ];

  final List<IconButton> buttonListToGiveRequestGgamf = [
    IconButton(
      onPressed: () {},
      icon: Icon(CupertinoIcons.xmark),
    ),
  ];

  final List<IconButton> buttonListToRecommendGgamf = [
    IconButton(
      onPressed: () {},
      icon: Icon(Icons.delete),
    ),
  ];

  @override
  void initState() {
    _innerTabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final receiveGgamfggamfList = ref.watch(receiveGgamfListViewModel);
        final sendGgamfListView = ref.watch(sendGgamfListViewModel);
        return Expanded(
          child: TabBarView(
            controller: widget._tabController,
            children: [
              _buildListView(buttonListToRecommendGgamf, widget._ggamfList),
              Column(
                children: [
                  RecommendGgamfListTabBar(
                    tabController: _innerTabController,
                    textIndex: textIndex,
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: TabBarView(
                      controller: _innerTabController,
                      children: [
                        _buildListView(buttonListToReceiveRequestGgamf,
                            receiveGgamfggamfList),
                        _buildListView(
                            buttonListToGiveRequestGgamf, sendGgamfListView),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildListView(
      List<IconButton> buttons, List<User> recommendGgamfList) {
    return recommendGgamfList.isEmpty
        ? Center(
            child: Text('현재 추전껨프가 없습니다.'),
          )
        : ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  visualDensity: const VisualDensity(horizontal: 3),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        recommendGgamfList[index].backgroundImage ?? ''),
                  ),
                  title: Text(recommendGgamfList[index].name ?? ''),
                  subtitle: Text(recommendGgamfList[index].intro ?? ''),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: buttons,
                  ),
                ),
            separatorBuilder: (context, index) => const Divider(
                  height: 10,
                  color: Colors.white,
                ),
            itemCount: recommendGgamfList.length);
  }
}
