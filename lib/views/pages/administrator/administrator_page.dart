import 'package:flutter/material.dart';
import 'package:ggamf_front/views/pages/administrator/report_list/report_list.dart';

class AdministratorPage extends StatefulWidget {
  const AdministratorPage({Key? key}) : super(key: key);

  @override
  State<AdministratorPage> createState() => _AdministratorPageState();
}

class _AdministratorPageState extends State<AdministratorPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ReportList(),
      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 30),
        ),
        fontFamily: 'NanumSquare',
      ),
    );
  }
}
