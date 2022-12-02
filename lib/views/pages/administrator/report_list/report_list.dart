import 'package:flutter/material.dart';
import 'package:ggamf_front/models/admin_model.dart';
import 'package:ggamf_front/views/pages/administrator/components/title_bar.dart';

class ReportList extends StatelessWidget {
  const ReportList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    insertReport();
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        constraints: BoxConstraints(minWidth: 1200),
        child: Column(
          children: [
            Container(
              height: size.height * 0.2,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TitleBar(size: size, title: '신고자 목록 페이지'),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: size.width * 0.15,
                    height: size.height * 0.8,
                    decoration: BoxDecoration(border: Border.all(width: 1)),
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Text('text'),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(30),
                      child: SingleChildScrollView(
                        child: DataTable(
                          border: TableBorder.all(),
                          columns: reportListColumns,
                          rows: reportListRows,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
