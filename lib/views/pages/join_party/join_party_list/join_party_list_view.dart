import 'dart:convert';

import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/party/model/room.dart';
import 'package:ggamf_front/utils/validator_util.dart';
import 'package:ggamf_front/views/pages/chatting/chatting_view.dart';
import 'package:ggamf_front/views/pages/join_party/join_party_list/join_party_list_view_model.dart';

class JoinPartyListView extends StatefulWidget {
  const JoinPartyListView({Key? key}) : super(key: key);

  @override
  State createState() => _JoinPartyListViewState();
}

class _JoinPartyListViewState extends State<JoinPartyListView> {
  int tag = 1;
  List<String> options = [
    '전체',
    '리그오브레전드',
    '오버워치',
    '배틀그라운드',
    '로스트아크',
    '발로란트',
    '스타크래프트',
    '기타',
  ];
  final _searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _sliverAppbar(),
    );
  }

  Widget _sliverAppbar() {
    return Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final jplv = ref.watch(joinPartyListViewModel);
      logger.d("길이보기: ${jplv.length}");
      return CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 150,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              title: SingleChildScrollView(
                child: Column(
                  children: [
                    _searchBar(),
                    _gameCategory(),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: _partyWindow(jplv),
          ),
        ],
      );
    });
  }

  SliverChildBuilderDelegate _partyWindow(List<Room> jplv) {
    return SliverChildBuilderDelegate((context, index) {
      return Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: InkWell(
                onTap: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (_) => ));
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("롤 골드 자랭하실분 구합니다", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          //Text("방 제목 : ${jplv[index].roomName}"),
                          Text("김한무"),
                          Row(
                            children: [
                              Icon(Icons.person, color: Color.fromRGBO(35, 204, 81, 1)),
                              Text("5명"),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 30),
                    SizedBox(
                      width: 75,
                      height: 75,
                      child: Image.asset("assets/images/lol.png"),
                      //Image.memory(Uri.parse("${jplv[index].gameLogo}").data!.contentAsBytes()),
                    ),
                  ],
                ),
              ),
            ),
            Divider(height: 2, color: Colors.grey[800], endIndent: 8)
          ],
        ),
      );
    }, childCount: 8
        //jplv.length,
        );
  }

  ChipsChoice<int> _gameCategory() {
    return ChipsChoice<int>.single(
      value: tag,
      onChanged: (val) => setState(() => tag = val),
      choiceItems: C2Choice.listFrom<int, String>(
        source: options,
        value: (i, v) => i,
        label: (i, v) => v,
      ),
      choiceStyle: C2ChipStyle.filled(
        borderAlpha: 10,
        height: 27,
        //foregroundColor: Colors.black,
        borderWidth: 5,
        foregroundStyle: const TextStyle(fontSize: 13),
        selectedStyle: const C2ChipStyle(
          backgroundColor: Color.fromRGBO(35, 204, 81, 1),
          foregroundColor: Colors.white,
        ),
        color: Colors.white,
      ),
    );
  }

  Widget _searchBar() {
    return SizedBox(
      width: 200,
      height: 30,
      child: TextFormField(
        controller: _searchText,
        decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          filled: true,
          suffixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        "파티참가",
      ),
    );
  }

  // Widget _enterParty() {
  //   return Dialog(
  //     child: Container(
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       padding: EdgeInsets.all(10),
  //       width: double.infinity,
  //       height: 150,
  //       child: Row(
  //         children: [
  //           Expanded(
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 SizedBox(
  //                   child: Text("롤 바텀 모집중", style: TextStyle(fontSize: 20)),
  //                   width: 150,
  //                 ),
  //                 SizedBox(height: 20),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text("방장이름"),
  //                     SizedBox(width: 60),
  //                     Text("2/5"),
  //                   ],
  //                 ),
  //                 SizedBox(height: 10),
  //                 ElevatedButton(
  //                   onPressed: () {},
  //                   child: Text(
  //                     "입장",
  //                     style: TextStyle(color: Colors.black),
  //                   ),
  //                   style: ElevatedButton.styleFrom(
  //                     backgroundColor: Colors.white,
  //                     side: BorderSide(
  //                       width: 1,
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           SizedBox(
  //             width: 100,
  //             height: 100,
  //             child: Image.asset(
  //               "assets/images/lol.png",
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
