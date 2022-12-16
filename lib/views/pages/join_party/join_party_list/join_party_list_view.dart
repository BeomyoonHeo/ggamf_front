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
  int tag = 2;
  List<String> options = [
    '리그오브레전드',
    '배틀그라운드',
    '로스트아크',
    '발로란트',
    '오버워치',
    '스타크래프트',
    '기타',
  ];

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
    return SliverChildBuilderDelegate(
      (context, index) {
        return Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(width: 1),
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
                      //Text("방 제목 : 롤 골드 자랭하실분 구합니다"),
                      Text("게임네임 : ${jplv[index].gameName} "),
                      SizedBox(height: 10),
                      Text("방 제목 : ${jplv[index].roomName}"),
                      SizedBox(height: 10),
                      Text("방장이름 : ${jplv[index].nickName}"),
                    ],
                  ),
                ),
                SizedBox(width: 30),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    "assets/images/lol.png",
                  ),
                ),
              ],
            ),
          ),
        );
      },
      childCount: jplv.length,
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
          borderStyle: BorderStyle.solid,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          borderColor: Colors.black,
          borderWidth: 2,
        ),
        color: Colors.white,
      ),
    );
  }

  SizedBox _searchBar() {
    return SizedBox(
      width: 200,
      height: 30,
      child: TextFormField(
        decoration: InputDecoration(
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

  Widget _enterParty() {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: 150,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Text("롤 바텀 모집중", style: TextStyle(fontSize: 20)),
                    width: 150,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("방장이름"),
                      SizedBox(width: 60),
                      Text("2/5"),
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "입장",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(
                        width: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(
                "assets/images/lol.png",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
