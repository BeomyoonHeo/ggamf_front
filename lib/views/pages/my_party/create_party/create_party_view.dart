import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ggamf_front/controller/party/create_party_controller.dart';
import 'package:ggamf_front/utils/validator_util.dart';
import 'package:ggamf_front/views/pages/chatting/chatting_view.dart';
import 'package:ggamf_front/views/pages/my_party/my_recruitment_party_list/my_recruitment_party_list_view.dart';

class CreatePartyView extends ConsumerStatefulWidget {
  const CreatePartyView({Key? key}) : super(key: key);

  @override
  ConsumerState<CreatePartyView> createState() => _CreatePartyViewState();
}

class _CreatePartyViewState extends ConsumerState<CreatePartyView> {
  //{'게임선택': 0, '리그 오브 레전드': 1, '오버워치': 2, '로스트아크': 3, '발로란트': 4, '기타': 5};
  //List<DropdownMenuItem<int>> _valueList = [];
  // object.map(key, value){
  //   _valueList.add(DropdownMenuItem(child: Text('${key}'), value: value,));
  // }

  List<String> _valueList = ['게임선택', '리그 오브 레전드', '오버워치', '로스트아크', '발로란트', '기타'];
  var _selectedValue = '게임선택';

  List<String> _numList = ['인원선택', '2', '3', '4', '5', '6', '7', '8'];
  var _selectedNum = '인원선택';

  bool _enableTextField = false;

  @override
  Widget build(BuildContext context) {
    final cpc = ref.read(createPartyController);

    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            _title(),
            SizedBox(height: 40),
            _selectGame(cpc),
            SizedBox(height: 40),
            _partyName(cpc),
            SizedBox(height: 40),
            _partyNumber(cpc),
            SizedBox(height: 70),
            _recruitmentButton(cpc),
          ],
        ),
      ),
    );
  }

  Widget _partyNumber(CreatePartyController cpc) {
    return Row(
      children: [
        DropdownButton(
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
                if (value == '인원선택') {
                  _selectedValue = value;
                } else {
                  cpc.totalPeopleController.text = value;
                }
              },
            );
          },
        ),
        SizedBox(
          width: 150,
          height: 40,
          child: TextFormField(
            controller: cpc.totalPeopleController,
            decoration: InputDecoration(),
            enabled: _enableTextField,
          ),
        ),
      ],
    );
  }

  Container _recruitmentButton(CreatePartyController cpc) {
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
              MaterialPageRoute(builder: (context) => MyRecruitmentPartyListView()),
            );
            cpc.requestCreateRoom();
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

  Container _partyName(CreatePartyController cpc) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1),
      ),
      child: TextFormField(
        controller: cpc.partyNameController,
        maxLength: 30,
        decoration: InputDecoration(
          hintText: '파티 방 제목을 입력하세요',
        ),
      ),
    );
  }

  Widget _selectGame(CreatePartyController cpc) {
    return Container(
      padding: EdgeInsets.all(5),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DropdownButton(
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
                  if (value == '기타') {
                    _enableTextField = true;
                    cpc.selectGameController.text = '';
                  } else if (value == '게임선택') {
                    cpc.selectGameController.text = '';
                    _enableTextField = false;
                  } else {
                    _enableTextField = true;
                    cpc.selectGameController.text = value;
                    _enableTextField = false;
                  }
                  ;
                },
              );
            },
          ),
          SizedBox(
            width: 150,
            height: 40,
            child: TextFormField(
              controller: cpc.selectGameController,
              decoration: InputDecoration(
                hintText: '기타 선택시 입력창',
              ),
              enabled: _enableTextField,
            ),
          ),
        ],
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
