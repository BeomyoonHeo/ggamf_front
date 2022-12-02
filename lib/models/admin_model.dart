import 'package:flutter/material.dart';

class Report {
  final reporter;
  final reportedReason;
  final maliciousUserNickname;
  final reportedDate;
  final reportedCount;
  final reportState;

  Report({
    required this.reporter,
    required this.reportedReason,
    required this.maliciousUserNickname,
    required this.reportedDate,
    required this.reportedCount,
    required this.reportState,
  });

  void insertReport() {
    for (int i = 0; i < 30; i++) {
      reportList.add(Report(
          reporter: '개발자${i}',
          reportedReason: '신고 사유 : ${i}',
          maliciousUserNickname: '악성 유저 닉네임 ${i}',
          reportedDate: DateTime.now(),
          reportState: '${i}일 정지',
          reportedCount: i));

      reportListRows.add(DataRow(cells: )
    }
  }

}

//dummydata
List<Report> reportList = [];

List<DataColumn> reportListColumns = [
  DataColumn(label: Text('신고 사유')),
  DataColumn(label: Text('신고일')),
  DataColumn(label: Text('신고자')),
  DataColumn(label: Text('악성유저 닉네임')),
  DataColumn(
    label: Text('신고상태'),
  ),
];

List<DataRow> reportListRows = [];
