import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ggamf_front/core/theme.dart';
import 'package:ggamf_front/main.dart';

class UpdateGameCategory {
  String gameName;

  UpdateGameCategory({required this.gameName});
}

void insertUpdateGameCategory(Function setState) {
  if (updateGameCategoryList.isEmpty) {
    for (int index = 0; index < 5; index++) {
      updateGameCategoryList
          .add(UpdateGameCategory(gameName: "게임이름 ${index + 1}"));
      updateGameCategoryRows.add(
        DataRow(cells: [
          DataCell(Text(updateGameCategoryList[index].gameName)),
          DataCell(ElevatedButton(
            style: ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ))),
            onPressed: () {
              _buildShowDialog(index, setState);
            },
            child: Text('수정하기'),
          )),
        ]),
      );
    }
  }
}

ElevatedButton _buildActionsButton(String text, int index,
    TextEditingController controller, Function setState) {
  return ElevatedButton(
    onPressed: () {
      updateGameCategoryList[index].gameName = controller.text;
      updateGameCategoryRows[index].cells.first =
          DataCell(Text(controller.text));
      setState();
      Navigator.pop(navigatorKey.currentState!.context);
    },
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

Future<dynamic> _buildShowDialog(int index, Function setState) {
  factory;
  TextEditingController testTextController =
      TextEditingController(text: '${updateGameCategoryList[index].gameName}');

  return showDialog(
      context: navigatorKey.currentState!.context,
      builder: (context) {
        return AlertDialog(
          icon: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(CupertinoIcons.xmark),
            ),
          ]),
          title: Text(
            '게임 카테고리 수정',
            style: theme().textTheme.displayLarge,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actionsPadding: EdgeInsets.only(bottom: 20),
          actions: [
            _buildActionsButton('수정하기', index, testTextController, setState),
            SizedBox(width: 10),
          ],
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          content: Container(
            width: 700,
            height: 200,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  ),
                  child: Row(
                    children: [
                      Text('게임 이름 : '),
                      Container(
                        width: 300,
                        child: TextFormField(
                          controller: testTextController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

//dummyData

List<UpdateGameCategory> updateGameCategoryList = [];

List<DataColumn> updateGameCategoryColumns = const [
  DataColumn(label: Text("게임 이름")),
  DataColumn(label: Text("수정하기 버튼")),
];

List<DataRow> updateGameCategoryRows = [];
