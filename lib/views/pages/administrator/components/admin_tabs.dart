import 'package:flutter/material.dart';

List<Text> adminTabList = const [
  Text('신고목록'),
  Text('매칭통계보기'),
  Text('게임 검색 카테고리 수정'),
  Text('게임 선택 박스 수정'),
  Text('방 관리'),
];

class AdminTabs extends StatefulWidget {
  final currentIndex;
  final Function state;
  const AdminTabs({Key? key, required this.currentIndex, required this.state})
      : super(key: key);

  @override
  State<AdminTabs> createState() => _AdminTabsState();
}

class _AdminTabsState extends State<AdminTabs> {
  Color nonSelectedColor = Colors.white;
  Color selectedColor = Colors.greenAccent;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 100),
      width: size.width * 0.13 < 1500 ? size.width * 0.13 : 1500,
      height: size.height * 0.8,
      decoration: BoxDecoration(border: Border.all(width: 1)),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ElevatedButton(
              style: ButtonStyle(
                padding: const MaterialStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 50)),
                backgroundColor: MaterialStatePropertyAll(
                    widget.currentIndex == index
                        ? selectedColor
                        : nonSelectedColor),
              ),
              onPressed: () {
                setState(() {
                  widget.state(index);
                });
              },
              child: adminTabList[index]);
        },
        itemCount: adminTabList.length,
      ),
    );
  }
}
