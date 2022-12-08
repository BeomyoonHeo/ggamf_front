import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CertificationNumberButton extends StatefulWidget {
  String certificationText;
  String phoneNumber;

  CertificationNumberButton(
      {Key? key, required this.certificationText, required this.phoneNumber})
      : super(key: key);

  @override
  State<CertificationNumberButton> createState() =>
      _CertificationNumberButtonState();
}

class _CertificationNumberButtonState extends State<CertificationNumberButton> {
  bool authOk = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(9)),
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            child: Text("인증받기"),
            onPressed: () async {
              await _auth.verifyPhoneNumber(
                phoneNumber: '+82 010 4699 9771', //${widget.phoneNumber}
                verificationCompleted: (PhoneAuthCredential credential) {
                  _auth.signInWithCredential(credential);
                },
                verificationFailed: (FirebaseAuthException e) {
                  setState(() {
                    widget.certificationText = '전화번호가 올바르지 않습니다!';
                  });
                },
                codeSent: (String verificationId, int? resendToken) {
                  setState(() {
                    widget.certificationText = '인증번호가 발송되었습니다.';
                    Fluttertoast.showToast(msg: '인증번호가 발송 되었습니다');
                  });
                },
                codeAutoRetrievalTimeout: (String verificationId) {},
              );
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
    );
  }
}
