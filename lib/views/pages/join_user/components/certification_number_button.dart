import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CertificationNumberButton extends StatefulWidget {
  String certificationText;
  String phoneNumber;
  bool authOk = false;
  bool showCertificationBar = false;

  CertificationNumberButton(
      {Key? key, required this.certificationText, required this.phoneNumber})
      : super(key: key);

  @override
  State<CertificationNumberButton> createState() =>
      _CertificationNumberButtonState();
}

class _CertificationNumberButtonState extends State<CertificationNumberButton> {
  bool authOk = false;
  final TextEditingController _credentialController = TextEditingController();
  String verificationId = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(9)),
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Text("인증받기"),
                onPressed: () async {
                  await _buildVerifyPhoneNumber();
                },
                style: ButtonStyle(
                  foregroundColor: const MaterialStatePropertyAll(Colors.black),
                  backgroundColor: const MaterialStatePropertyAll(Colors.white),
                  padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 30)),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(width: 1),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Text(widget.certificationText),
              ),
            ],
          ),
          authOk
              ? SizedBox()
              : Visibility(
                  visible: widget.showCertificationBar,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        child: Text("입력하기"),
                        onPressed: () async {
                          PhoneAuthCredential phoneAuthCredential =
                              PhoneAuthProvider.credential(
                                  verificationId: verificationId,
                                  smsCode: _credentialController.text);
                          signInWithPhoneAuthCredential(phoneAuthCredential);
                        },
                        style: ButtonStyle(
                          foregroundColor:
                              const MaterialStatePropertyAll(Colors.black),
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.white),
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 30)),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(width: 1),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _credentialController,
                          autovalidateMode: AutovalidateMode.always,
                          maxLength: 6,
                          decoration:
                              InputDecoration(hintText: '인증번호 6자리를 입력해주세요'),
                        ),
                      ),
                    ],
                  )),
        ],
      ),
    );
  }

  Future<void> _buildVerifyPhoneNumber() {
    return _auth.verifyPhoneNumber(
      phoneNumber: '+82 010 4699 9771', //${widget.phoneNumber}
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        setState(() {
          widget.certificationText = '전화번호가 올바르지 않습니다!';
        });
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          widget.certificationText = '인증번호가 발송되었습니다.';
          Fluttertoast.showToast(msg: '인증번호가 발송 되었습니다');
          widget.showCertificationBar = true;
          verificationId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      if (authCredential.user != null) {
        setState(() {
          print("인증완료 및 로그인성공");
          authOk = true;
        });
        await _auth.currentUser!.delete();
        print("auth정보삭제");
        _auth.signOut();
        print("phone로그인된것 로그아웃");
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        print("인증실패..로그인실패");
      });

      await Fluttertoast.showToast(
          msg: e.message as String,
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          fontSize: 16.0);
    }
  }
}

// Positioned.fill(
// child: Visibility(
// visible: false,
// child: Container(
// width: double.infinity,
// height: double.infinity,
// child: Center(
// child: Container(
// width: MediaQuery.of(context).size.width * 0.9,
// height: 80,
// color: Colors.white,
// child: Center(
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: const [
// SizedBox(
// width: 20,
// height: 20,
// child: CircularProgressIndicator()),
// SizedBox(
// width: 20,
// ),
// Text("잠시만 기다려 주세요"),
// SizedBox(
// width: 20,
// ),
// Opacity(
// opacity: 0,
// child: SizedBox(
// width: 20,
// height: 20,
// child: CircularProgressIndicator()),
// ),
// ],
// ),
// ),
// ),
// ),
// ),
// ),
// )
