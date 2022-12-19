import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ggamf_front/core/theme.dart';
import 'package:ggamf_front/main.dart';
import 'package:intl/intl.dart';

class Report {
  final reporter;
  final reportedReason;
  final reportedReasonDetail;
  final maliciousUserNickname;
  final reportedDate;
  final reportedCount;
  final reportState;

  Report({
    required this.reporter,
    required this.reportedReason,
    required this.reportedReasonDetail,
    required this.maliciousUserNickname,
    required this.reportedDate,
    required this.reportedCount,
    required this.reportState,
  });
}

void insertReport() {
  if (reportList.isEmpty) {
    for (int i = 0; i < 29; i++) {
      if (reportList.length >= 29) break;
      List<DataCell> reportListCell = [];

      reportList.add(
        Report(
            reporter: '개발자${i + 1}',
            reportedReason: reportedReasonDetailList[i % 3],
            reportedReasonDetail: '무엇인가 저질럿습니다. : ${i + 1}',
            maliciousUserNickname: '악성 유저 닉네임 ${i + 1}',
            reportedDate:
                DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()),
            reportState: '${i + 1}일 정지',
            reportedCount: i + 1),
      );

      reportListCell.add(
        DataCell(
          Text(reportList[i].reportedReason),
        ),
      );
      reportListCell.add(
        DataCell(
          Text('${reportList[i].reportedDate}'),
        ),
      );
      reportListCell.add(
        DataCell(
          Text(reportList[i].reporter),
        ),
      );
      reportListCell.add(
        DataCell(
          Text(reportList[i].maliciousUserNickname),
        ),
      );
      reportListCell.add(
        DataCell(Text(reportList[i].reportState), showEditIcon: true,
            onTap: () {
          showDialog(
              context: navigatorKey.currentState!.context,
              builder: (context) {
                return AlertDialog(
                  icon:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(CupertinoIcons.xmark),
                    ),
                  ]),
                  title: Text(
                    '리포트 내용',
                    style: theme().textTheme.displayLarge,
                  ),
                  actionsAlignment: MainAxisAlignment.center,
                  actionsPadding: const EdgeInsets.only(bottom: 20),
                  actions: [
                    _buildActionsButton('반려'),
                    const SizedBox(width: 10),
                    _buildActionsButton('7일정지'),
                    const SizedBox(width: 10),
                    _buildActionsButton('30일정지'),
                    const SizedBox(width: 10),
                    _buildActionsButton('영구정지'),
                  ],
                  insetPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  content: Container(
                    width: 700,
                    height: 700,
                    child: Column(
                      children: [
                        _buildReportContainer(i),
                        const SizedBox(height: 10),
                        _buildReportReasonContainer(i),
                        const SizedBox(height: 10),
                        _buildReasonDetailContainer(i),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          decoration: BoxDecoration(border: Border.all()),
                          child: Row(
                            children: [
                              Text(
                                  '해당유저 신고 카운트는 ${reportList[i].reportedCount}번 입니다.')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        }),
      );

      reportListRows.add(DataRow(cells: reportListCell));
    }
  }
}

ElevatedButton _buildActionsButton(String text) {
  return ElevatedButton(
    onPressed: () {},
    child: Text(text),
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll(Colors.black),
      backgroundColor: MaterialStatePropertyAll(Colors.white),
      padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(width: 1),
        ),
      ),
    ),
  );
}

Container _buildReasonDetailContainer(int i) {
  return Container(
    height: 200,
    width: 700,
    decoration: BoxDecoration(border: Border.all()),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '상세내용 : ${reportList[i].reportedReasonDetail}',
          style: theme().textTheme.displayLarge,
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '신고자 : ${reportList[i].reporter}',
                style: theme().textTheme.displayLarge,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Container _buildReportReasonContainer(int index) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    decoration: BoxDecoration(border: Border.all()),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('신고 사유 : ${reportList[index].reportedReason}',
            style: theme().textTheme.displayLarge),
      ],
    ),
  );
}

Container _buildReportContainer(int index) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    decoration: BoxDecoration(border: Border.all()),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '악성유저 : ${reportList[index].maliciousUserNickname}',
          style: theme().textTheme.displayLarge,
        ),
        Text(
          '신고일 : ${reportList[index].reportedDate}',
          style: theme().textTheme.displayLarge,
        ),
      ],
    ),
  );
}

//dummydata

List<String> reportedReasonDetailList = ['비방 및 욕설', '비매너 행위', '광고 및 기타 행위 글'];

List<Report> reportList = [];

List<DataRow> reportListRows = [];

List<DataColumn> reportListColumns = const [
  DataColumn(label: Text('신고 사유')),
  DataColumn(label: Text('신고일')),
  DataColumn(label: Text('신고자')),
  DataColumn(label: Text('악성유저 닉네임')),
  DataColumn(label: Text('신고상태 /  상세 확인하기')),
];
