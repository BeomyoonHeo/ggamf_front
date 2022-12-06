import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ggamf_front/data/data.dart';
import 'package:ggamf_front/views/pages/recommend_ggamef/recommend_ggamf_list/components/recommend_ggamf_list_tab_bar.dart';

class RecommendGgamfListTabView extends StatefulWidget {
  RecommendGgamfListTabView({
    Key? key,
    required TabController tabController,
    required List<Data> ggamfList,
  })  : _tabController = tabController,
        _ggamfList = ggamfList,
        super(key: key);

  final TabController _tabController;
  final List<Data> _ggamfList;
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
                    _buildListView(
                        buttonListToReceiveRequestGgamf, widget._ggamfList),
                    _buildListView(
                        buttonListToGiveRequestGgamf, widget._ggamfList),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildListView(
      List<IconButton> buttons, List<Data> recommendGgamfList) {
    return ListView.separated(
        itemBuilder: (context, index) => ListTile(
              visualDensity: const VisualDensity(horizontal: 3),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(recommendGgamfList[index].avatar),
              ),
              title: Text(recommendGgamfList[index].firstName),
              subtitle: Text(recommendGgamfList[index].lastName),
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
