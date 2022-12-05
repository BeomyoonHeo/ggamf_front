import 'package:flutter/material.dart';

List<String> titleList = [
  '신고자 목록 페이지',
  '게임 매칭 통계 보기 페이지',
  '방 생성 시 게임 선택 카테고리 수정',
  '게임선택 박스 수정',
  '매칭 방 관리'
];

class TitleBar extends StatefulWidget {
  const TitleBar({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  State<TitleBar> createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: size.width * 0.5 < 1500 ? size.width * 0.5 : 1500,
        height: size.height * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              titleList[widget.index],
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
      ),
    );
  }
}
