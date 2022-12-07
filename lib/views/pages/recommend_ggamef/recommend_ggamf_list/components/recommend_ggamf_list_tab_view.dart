import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ggamf_front/data/data.dart';
import 'package:ggamf_front/data/rest_client.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';
import 'package:ggamf_front/views/pages/recommend_ggamef/recommend_ggamf_list/components/recommend_ggamf_list_tab_bar.dart';

class RecommendGgamfListTabView extends StatefulWidget {
  //인터셉터 추가
  final dio = Dio()
    ..interceptors.add(
      //cascade 연산자를 실행하여 바로 add 하였다.
      CustomLogInterceptor(),
    );
  RecommendGgamfListTabView({
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
    final client =
        RestClient(widget.dio); //RestClient를 등록 - 스프링으로 치면 controller 같은 느낌이다.

    return Expanded(
      child: TabBarView(
        controller: widget._tabController,
        children: [
          _buildListView(buttonListToRecommendGgamf, client),
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
                    _buildListView(buttonListToReceiveRequestGgamf, client),
                    _buildListView(buttonListToGiveRequestGgamf, client),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildListView(List<IconButton> buttons, RestClient client) {
    return FutureBuilder<User?>(
      future: client.getUser(page: 2),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          User usersInfo = snapshot.data!;
          return ListView.separated(
              itemBuilder: (context, index) => ListTile(
                    visualDensity: const VisualDensity(horizontal: 3),
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(usersInfo.data[index].avatar),
                    ),
                    title: Text(usersInfo.data[index].firstName),
                    subtitle: Text(usersInfo.data[index].lastName),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: buttons,
                    ),
                  ),
              separatorBuilder: (context, index) => const Divider(
                    height: 10,
                    color: Colors.white,
                  ),
              itemCount: usersInfo.data.length);
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
