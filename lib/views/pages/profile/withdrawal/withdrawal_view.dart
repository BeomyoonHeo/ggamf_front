import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WithdrawalView extends StatefulWidget {
  const WithdrawalView({Key? key}) : super(key: key);

  @override
  State<WithdrawalView> createState() => _WithdrawalViewState();
}

class _WithdrawalViewState extends State<WithdrawalView> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 100),
            Text(
              "탈퇴전에 확인하세요",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(width: 1),
              ),
              child: Column(
                children: [
                  Text("* 채팅내역, 프로필등 모든 정보가 삭제됩니다"),
                  Text("* 삭제된 내역은 복구가 불가능 합니다"),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    }),
                Text("위의 내용을 모두 숙지하였고 이에 동의합니다")
              ],
            ),
            Divider(),
            SizedBox(height: 20),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                minimumSize: Size(150, 50),
              ),
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: Text("정말 탈퇴하시겠습니까?"),
                    actions: [
                      CupertinoDialogAction(child: Text("네")),
                      CupertinoDialogAction(
                        child: Text("아니오"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
              child: Text(
                "탈퇴하기",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          BackButton(color: Colors.black),
          Text("회원탈퇴"),
        ],
      ),
    );
  }
}
