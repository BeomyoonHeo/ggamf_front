import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/controller/user/ggamf_controller.dart';
import 'package:ggamf_front/domain/user/model/ggamf.dart';
import 'package:ggamf_front/views/pages/recommend_ggamef/recommend_ggamf_list/components/recommend_ggamf_list_tab_bar.dart';
import 'package:ggamf_front/views/pages/recommend_ggamef/recommend_ggamf_list/receive_ggamf_list_view_model.dart';
import 'package:ggamf_front/views/pages/recommend_ggamef/recommend_ggamf_list/send_ggamf_list_view_model.dart';

class RecommendGgamfListTabView extends StatefulWidget {
  const RecommendGgamfListTabView({
    Key? key,
    required TabController tabController,
    required List<Ggamf> ggamfList,
  })  : _tabController = tabController,
        _ggamfList = ggamfList,
        super(key: key);

  final TabController _tabController;
  final List<Ggamf> _ggamfList;
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
              _buildRecommendGgamfListView(widget._ggamfList, ref),
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
                        _buildReceiveGgamfListView(receiveGgamfggamfList, ref),
                        _buildSendGgamfListView(sendGgamfListView, ref),
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

  Widget _buildRecommendGgamfListView(List<Ggamf> ggamfList, WidgetRef ref) {
    final glc = ref.read(ggamfController);

    return ggamfList.isEmpty
        ? Center(
            child: Text('현재 추전껨프가 없습니다.'),
          )
        : ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  visualDensity: const VisualDensity(horizontal: 3),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(ggamfList[index].photo ?? ''),
                  ),
                  title: Text(ggamfList[index].nickname ?? ''),
                  subtitle: Text(ggamfList[index].intro ?? ''),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          function() {
                            Navigator.pop(context);
                          }

                          _showAlertDialog(context, '추천 껨프 삭제',
                              '해당 껨프를 삭제하시겠습니까?', function);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
            separatorBuilder: (context, index) => const Divider(
                  height: 10,
                  color: Colors.white,
                ),
            itemCount: ggamfList.length);
  }

  Widget _buildReceiveGgamfListView(List<Ggamf> ggamfList, WidgetRef ref) {
    final rgc = ref.read(ggamfController);
    return ggamfList.isEmpty
        ? Center(
            child: Text('현재 추전껨프가 없습니다.'),
          )
        : ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  visualDensity: const VisualDensity(horizontal: 3),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(ggamfList[index].photo ?? ''),
                  ),
                  title: Text(ggamfList[index].nickname ?? ''),
                  subtitle: Text(ggamfList[index].intro ?? ''),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(CupertinoIcons.person_badge_plus_fill),
                        onPressed: () {
                          function() {
                            rgc.acceptReceiveGgamf(ggamfList[index].userId);
                            Navigator.pop(context);
                          }

                          _showAlertDialog(
                              context, '껨프 추가', '해당 껨프를 추가하시겠습니까?', function);
                        },
                      ),
                      IconButton(
                        onPressed: () {
                          function() {
                            rgc.denyReceiveGgamf(ggamfList[index].userId);
                            Navigator.pop(context);
                          }

                          _showAlertDialog(context, '껨프 요청 무시',
                              '해당 껨프요청을 무시하시겠습니까?', function);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
            separatorBuilder: (context, index) => const Divider(
                  height: 10,
                  color: Colors.white,
                ),
            itemCount: ggamfList.length);
  }

  Widget _buildSendGgamfListView(List<Ggamf> ggamfList, WidgetRef ref) {
    final rgc = ref.read(ggamfController);
    return ggamfList.isEmpty
        ? const Center(
            child: Text('현재 추전껨프가 없습니다.'),
          )
        : ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  visualDensity: const VisualDensity(horizontal: 3),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(ggamfList[index].photo ?? ''),
                  ),
                  title: Text(ggamfList[index].nickname ?? ''),
                  subtitle: Text(ggamfList[index].intro ?? ''),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          function() {
                            rgc.cancelSendGgamf(ggamfList[index].userId);
                            Navigator.pop(context);
                          }

                          _showAlertDialog(context, '껨프 요청 무시',
                              '해당 껨프요청을 무시하시겠습니까?', function);
                        },
                        icon: const Icon(CupertinoIcons.xmark),
                      ),
                    ],
                  ),
                ),
            separatorBuilder: (context, index) => const Divider(
                  height: 10,
                  color: Colors.white,
                ),
            itemCount: ggamfList.length);
  }

  Future<dynamic> _showAlertDialog(BuildContext context, String titleText,
      String contentText, Function function) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('${titleText}'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${contentText}'),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('취소'),
              ),
              ElevatedButton(
                onPressed: () {
                  function();
                },
                child: Text('확인'),
              ),
            ],
          );
        });
  }
}
