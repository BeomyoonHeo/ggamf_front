import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/controller/party/create_party_controller.dart';
import 'package:ggamf_front/domain/party/model/game_code.dart';
import 'package:ggamf_front/utils/validator_util.dart';
import 'package:ggamf_front/views/pages/my_party/create_party/create_party_view_model.dart';

class CreatePartyView extends ConsumerStatefulWidget {
  const CreatePartyView({Key? key}) : super(key: key);

  @override
  ConsumerState<CreatePartyView> createState() => _CreatePartyViewState();
}

class _CreatePartyViewState extends ConsumerState<CreatePartyView> {
  List<DropdownMenuItem> _valueList = [];
  final Map<String, dynamic> _keyList = {
    '게임선택': 0,
    '리그 오브 레전드': 1,
    '오버워치': 2,
    '로스트아크': 3,
    '발로란트': 4,
    '기타': 5
  };
  String _selectedValue = '게임선택';
  List<String> _numList = ['인원선택', '2', '3', '4', '5', '6', '7', '8'];
  var _selectedNum = '인원선택';

  bool _enableTextField = false;

  @override
  void initState() {
    ref.refresh(createPartyController);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    ref.invalidate(createPartyController);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final cpv = ref.watch(createPartyViewModel);
    final cpc = ref.read(createPartyController);
    logger.d("게임카테고리길이보기 :  ${cpv!.length}");
    if (_valueList.isEmpty) {
      _keyList.forEach((key, value) {
        _valueList.add(DropdownMenuItem(
          child: Text('${key}'),
          value: key,
        ));
      });
    }
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            _title(),
            const SizedBox(height: 40),
            _selectGame(cpc, cpv),
            const SizedBox(height: 40),
            _partyName(cpc),
            const SizedBox(height: 40),
            _partyNumber(cpc),
            const SizedBox(height: 70),
            _recruitmentButton(cpc),
          ],
        ),
      ),
    );
  }

  Widget _recruitmentButton(CreatePartyController cpc) {
    return ElevatedButton(
      onPressed: () {
        cpc.requestCreateRoom();
      },
      child: Text(
        "모집 시작!",
        style: TextStyle(fontSize: 20),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromRGBO(35, 204, 81, 1),
        minimumSize: const Size(150, 50),
      ),
    );
  }

  Container _partyName(CreatePartyController cpc) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
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

  Widget _selectGame(
    CreatePartyController cpc,
    List<GameCode> cpv,
  ) {
    return Container(
      padding: EdgeInsets.all(5),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DropdownButton(
            value: _selectedValue,
            items: _valueList,
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
                    logger.d(cpc.selectGameController.text);
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

  Widget _partyNumber(CreatePartyController cpc) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    _selectedNum = value;
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
      ),
    );
  }

  Container _title() {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        gradient: LinearGradient(
            colors: [
              Color.fromRGBO(35, 204, 81, 0.8),
              Color.fromRGBO(35, 204, 81, 1)
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            tileMode: TileMode.clamp),
      ),
      child: Text("Create the Party",
          style: TextStyle(fontSize: 30, color: Colors.white)),
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
