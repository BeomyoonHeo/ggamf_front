import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:ggamf_front/models/admin_report_model.dart';
import 'package:ggamf_front/views/pages/administrator/components/title_bar.dart';

class ReportList extends StatelessWidget {
  const ReportList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    insertReport();
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints(minWidth: 500, minHeight: 500),
        child: Column(
          children: [
            Container(
              height: size.height * 0.2,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TitleBar(title: '신고자 목록 페이지'),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width * 0.13,
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
                      padding: EdgeInsets.symmetric(horizontal: 150),
                      child: DataTable2(
                        minWidth: 600,
                        headingRowHeight: 50,
                        border: TableBorder.all(),
                        columns: reportListColumns,
                        rows: reportListRows,
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
