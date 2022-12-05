import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ggamf_front/core/theme.dart';
import 'package:ggamf_front/main.dart';

class GameSelectBoxModel {
  Image gameIcon;
  String gameName;

  GameSelectBoxModel({required this.gameIcon, required this.gameName});
}

void insertGameSelectBoxModel(Function setState) {
  if (gameSelectBoxModelList.isEmpty) {
    for (int index = 0; index < 5; index++) {
      gameSelectBoxModelList.add(GameSelectBoxModel(
          gameIcon: Image.asset(
            'assets/images/cart1.png',
            scale: 0.7,
          ),
          gameName: '게임이름${index}'));

      gameSelectBoxModelRows.add(
        DataRow2(cells: [
          DataCell(
            gameSelectBoxModelList[index].gameIcon,
          ),
          DataCell(Text(gameSelectBoxModelList[index].gameName)),
          DataCell(ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.greenAccent),
                padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ))),
            onPressed: () {
              _buildShowDialog(index, setState);
            },
            child: Text('수정하기'),
          )),
        ], specificRowHeight: 150),
      );
    }
  }
}

ElevatedButton _buildActionsButton(String text, int index,
    TextEditingController controller, Function setState) {
  return ElevatedButton(
    onPressed: () {
      gameSelectBoxModelList[index].gameName = controller.text;
      gameSelectBoxModelRows[index].cells.first =
          DataCell(gameSelectBoxModelList[index].gameIcon);
      gameSelectBoxModelRows[index].cells.singleWhere(
        (e) {
          if (e.child.runtimeType.toString() == 'Text') {
            gameSelectBoxModelRows[index]
                    .cells[gameSelectBoxModelRows[index].cells.indexOf(e)] =
                DataCell(Text(gameSelectBoxModelList[index].gameName));
            return true;
          }
          return false;
        },
      );
      setState();
      Navigator.pop(navigatorKey.currentState!.context);
    },
    child: Text(text),
    style: ButtonStyle(
      foregroundColor: const MaterialStatePropertyAll(Colors.black),
      backgroundColor: const MaterialStatePropertyAll(Colors.white),
      padding: const MaterialStatePropertyAll(EdgeInsets.all(20)),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(width: 1),
        ),
      ),
    ),
  );
}

Future<dynamic> _buildShowDialog(int index, Function setState) {
  TextEditingController testTextController =
      TextEditingController(text: '${gameSelectBoxModelList[index].gameName}');

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
                              borderSide: BorderSide(width: 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  ),
                  child: Row(
                    children: [
                      Text('게임 아이콘 : '),
                      Container(
                        width: 300,
                        height: 120,
                        child: IconButton(
                          iconSize: 120,
                          onPressed: () async {
                            // var result = await ImagePickerWeb.getImageInfo;
                            // String? mimeType = mime((result!.fileName));
                            // // File mediaFile = File(result.data!,
                            // //     result.fileName!, {'type': mimeType});
                            // gameSelectBoxModelList[index].gameIcon =
                            //     Image.memory(result.data!);
                            setState();
                          },
                          icon: gameSelectBoxModelList[index].gameIcon,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      });
}

//dummyData
List<GameSelectBoxModel> gameSelectBoxModelList = [];
List<DataColumn> gameSelectBoxModelColumns = const [
  DataColumn(label: Text('게임아이콘')),
  DataColumn(label: Text('게임 이름')),
  DataColumn(label: Text('수정 하기')),
];
List<DataRow> gameSelectBoxModelRows = [];
