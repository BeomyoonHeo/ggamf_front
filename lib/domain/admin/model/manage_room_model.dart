import 'package:flutter/material.dart';

class ManageRoomModel {
  final String personnel;
  final String roomName;
  final String roomOwner;

  ManageRoomModel(
      {required this.personnel,
      required this.roomName,
      required this.roomOwner});
}

void insertManageRoom() {
  if (manageRoomModelList.isEmpty) {
    for (int index = 0; index < 5; index++) {
      manageRoomModelList.add(
        ManageRoomModel(
            personnel: '${index + 1}/8',
            roomName: '방 제목 ${index + 1}',
            roomOwner: '방장 이름 ${index + 1}'),
      );
      manageRoomModelRows.add(
        DataRow(
          cells: [
            DataCell(Text('${manageRoomModelList[index].personnel}')),
            DataCell(Text('${manageRoomModelList[index].roomName}')),
            DataCell(Text('${manageRoomModelList[index].roomOwner}')),
          ],
        ),
      );
    }
  }
}

List<ManageRoomModel> manageRoomModelList = [];

List<DataColumn> manageRoomModelColumn = const [
  DataColumn(label: Text('방 인원')),
  DataColumn(label: Text('방 이름')),
  DataColumn(label: Text('방장 이름')),
];

List<DataRow> manageRoomModelRows = [];
