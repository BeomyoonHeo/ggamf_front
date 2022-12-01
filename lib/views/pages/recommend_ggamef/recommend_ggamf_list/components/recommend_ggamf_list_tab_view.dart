import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class _RecommendGgamfListTabViewState extends State<RecommendGgamfListTabView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: widget._tabController,
        children: [
          ListView.separated(
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
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.person_badge_plus_fill),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 10,
                  color: Colors.white,
                );
              },
              itemCount: 10),
          ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(
                      'https://source.unsplash.com/random/300x200?v=${DateTime.now().millisecondsSinceEpoch}'),
                  title: Text(''),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 0,
                  color: Colors.white,
                );
              },
              itemCount: 10),
        ],
      ),
    );
  }
}
