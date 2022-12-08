import 'package:flutter/material.dart';
import 'package:ggamf_front/views/pages/chatting/chatting_page.dart';

class CreatePartyPage extends StatefulWidget {
  const CreatePartyPage({Key? key}) : super(key: key);

  @override
  State<CreatePartyPage> createState() => _CreatePartyPageState();
}

class _CreatePartyPageState extends State<CreatePartyPage> {
  List<String> _valueList = ['리그 오브 레전드', '오버워치', '로스트아크', '발로란트', '기타'];
  var _selectedValue;

  List<String> _numList = ['2', '3', '4', '5', '6', '7', '8'];
  var _selectedNum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            _title(),
            SizedBox(height: 40),
            _selectGame(),
            SizedBox(height: 40),
            _partyName(),
            SizedBox(height: 40),
            _partyNumber(),
            SizedBox(height: 70),
            _recruitmentButton(context),
          ],
        ),
      ),
    );
  }

  DropdownButton<String> _partyNumber() {
    return DropdownButton(
      hint: Text("인원을 선택하세요"),
      value: _selectedNum,
      items: _numList.map((String item) {
        return DropdownMenuItem<String>(
          child: Text('$item'),
          value: item,
        );
      }).toList(),
      onChanged: (dynamic value) {
        setState(
          () {
            _selectedNum = value;
          },
        );
      },
    );
  }

  Container _recruitmentButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1),
      ),
      child: Container(
        width: double.infinity,
        height: 40,
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChattingPage()),
            );
          },
          child: Text(
            "모집 시작!",
            style: TextStyle(fontSize: 20),
          ),
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
          ),
        ),
      ),
    );
  }

  Container _partyName() {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1),
      ),
      child: TextFormField(
        maxLength: 30,
        decoration: InputDecoration(
          hintText: '파티 방 제목을 입력하세요',
        ),
      ),
    );
  }

  Widget _selectGame() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(5),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1),
        ),
        child: Column(
          children: [
            DropdownButton(
              hint: Text("게임을 선택하세요"),
              value: _selectedValue,
              items: _valueList.map((String item) {
                return DropdownMenuItem<String>(
                  child: Text('$item'),
                  value: item,
                );
              }).toList(),
              onChanged: (dynamic value) {
                setState(
                  () {
                    _selectedValue = value;
                  },
                );
              },
            ),
            SizedBox(
              width: 150,
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: '기타 선택시 입력창',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _title() {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.amber,
      ),
      child: Text(
        "Create the Party",
        style: TextStyle(fontSize: 30),
      ),
      alignment: Alignment.center,
    );
  }

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          BackButton(color: Colors.black),
          Text(
            "파티 생성",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ],
      ),
      elevation: 0,
    );
  }
}
