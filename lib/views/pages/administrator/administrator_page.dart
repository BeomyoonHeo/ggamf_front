import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:ggamf_front/domain/admin/model/admin_game_matching_statics_model.dart';
import 'package:ggamf_front/domain/admin/model/admin_report_model.dart';
import 'package:ggamf_front/domain/admin/model/game_select_box_model.dart';
import 'package:ggamf_front/domain/admin/model/manage_room_model.dart';
import 'package:ggamf_front/domain/admin/model/update_game_category_model.dart';
import 'package:ggamf_front/main.dart';
import 'package:ggamf_front/views/pages/administrator/components/admin_tabs.dart';
import 'package:ggamf_front/views/pages/administrator/components/title_bar.dart';

class AdministratorPage extends StatelessWidget {
  const AdministratorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: const MainPage(),
      theme: ThemeData(
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(Colors.black),
            backgroundColor: MaterialStatePropertyAll(Colors.white),
            elevation: MaterialStatePropertyAll(0),
          ),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 30),
        ),
        fontFamily: 'NanumSquare',
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<List<DataColumn>> globalColumns = [
    reportListColumns,
    matchingStaticColumns,
    updateGameCategoryColumns,
    gameSelectBoxModelColumns,
    manageRoomModelColumn,
  ];
  List<List<DataRow>> globalRows = [
    reportListRows,
    matchingStaticRows,
    updateGameCategoryRows,
    gameSelectBoxModelRows,
    manageRoomModelRows,
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    switch (_currentIndex) {
      case 0:
        {
          insertReport();
        }
        break;

      case 1:
        {
          insertMatchingStatic();
        }
        break;

      case 2:
        {
          void mainState() {
            setState(() {});
          }

          insertUpdateGameCategory(mainState);
        }
        break;
      case 3:
        {
          void mainState() {
            setState(() {});
          }

          insertGameSelectBoxModel(mainState);
        }
        break;

      case 4:
        {
          insertManageRoom();
        }
        break;
    }

    final size = MediaQuery.of(context).size;

    void mainState(value) {
      setState(() {
        _currentIndex = value ?? _currentIndex;
      });
    }

    return Scaffold(
      body: Container(
        constraints: const BoxConstraints(minWidth: 1500),
        child: Column(
          children: [
            TitleBar(
              index: _currentIndex,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AdminTabs(currentIndex: _currentIndex, state: mainState),
                  Expanded(
                    child: Container(
                      width:
                          size.width * 0.13 < 1500 ? size.width * 0.13 : 1500,
                      padding: const EdgeInsets.symmetric(horizontal: 150),
                      child: DataTable2(
                        minWidth: 600,
                        headingRowHeight: 50,
                        border: TableBorder.all(),
                        columns: globalColumns[_currentIndex],
                        rows: globalRows[_currentIndex],
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
