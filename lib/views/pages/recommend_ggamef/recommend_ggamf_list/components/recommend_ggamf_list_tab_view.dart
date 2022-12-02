import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ggamf_front/views/pages/recommend_ggamef/recommend_ggamf_list/components/recommend_ggamf_list_tab_bar.dart';

class RecommendGgamfListTabView extends StatefulWidget {
  const RecommendGgamfListTabView({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

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
          _buildListView(buttonListToRecommendGgamf),
          Container(
            child: Column(
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
                      _buildListView(buttonListToReceiveRequestGgamf),
                      _buildListView(buttonListToGiveRequestGgamf),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListView(List<IconButton> buttons) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          visualDensity: VisualDensity(horizontal: 3),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://source.unsplash.com/random/300x200?v=${DateTime.now().millisecondsSinceEpoch}'),
          ),
          title: Text(
            '닉네임',
            style: TextStyle(fontFamily: 'NanumSquare'),
          ),
          subtitle: Text(
            '상태 메시지',
            style: TextStyle(fontFamily: 'NanumSquare'),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: buttons,
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          height: 10,
          color: Colors.white,
        );
      },
    );
  }
}
