import 'package:flutter/material.dart';

class MatchingStatic {
  final int rank;
  final String gameName;
  final int matchingCount;

  MatchingStatic(
      {required this.rank,
      required this.gameName,
      required this.matchingCount});
}

void insertMatchingStatic() {
  for (int index = 0; index < 5; index++) {
    if (matchingStaticList.length > 4) break;
    matchingStaticList.add(
      MatchingStatic(
          rank: index, gameName: '게임 이름 ${index}', matchingCount: index),
    );
    matchingStaticRows.add(DataRow(cells: [
      DataCell(Text('${matchingStaticList[index].rank}')),
      DataCell(Text('${matchingStaticList[index].gameName}')),
      DataCell(Text('${matchingStaticList[index].matchingCount}')),
    ]));
  }
}

//dummyData

List<MatchingStatic> matchingStaticList = [];

List<DataColumn> matchingStaticColumns = [
  DataColumn(label: Text('순위')),
  DataColumn(label: Text('게임 명')),
  DataColumn(label: Text('매칭 횟수')),
];

List<DataRow> matchingStaticRows = [];
