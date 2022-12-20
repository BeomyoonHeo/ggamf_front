import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/controller/user/ggamf_controller.dart';
import 'package:ggamf_front/controller/user/user_controller.dart';

class WithdrawalView extends ConsumerStatefulWidget {
  const WithdrawalView({Key? key}) : super(key: key);

  @override
  ConsumerState<WithdrawalView> createState() => _WithdrawalViewState();
}

class _WithdrawalViewState extends ConsumerState<WithdrawalView> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final uc = ref.read(userController);

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
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Color.fromRGBO(35, 204, 81, 1)),
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromRGBO(35, 204, 81, 1),
                minimumSize: const Size(150, 50),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => Dialog(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "정말 탈퇴하시겠습니까?",
                            style: TextStyle(fontSize: 20),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                height: 35,
                                width: 100,
                                child: ElevatedButton(
                                  onPressed: () {
                                    uc.withdrawUser("WITHDRAW");
                                  },
                                  child: Text(
                                    "예",
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: const Color.fromRGBO(35, 204, 81, 1),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 35,
                                width: 100,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "아니오",
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: const Color.fromRGBO(35, 204, 81, 1),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
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
