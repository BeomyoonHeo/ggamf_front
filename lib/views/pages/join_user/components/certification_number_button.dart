import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ggamf_front/controller/user/join_user_controller.dart';
import 'package:ggamf_front/provider/authentication_provider.dart';

class CertificationNumberButton extends ConsumerStatefulWidget {
  String certificationText;
  bool showCertificationBar = false;

  CertificationNumberButton({Key? key, required this.certificationText}) : super(key: key);

  @override
  ConsumerState<CertificationNumberButton> createState() => _CertificationNumberButtonState();
}

class _CertificationNumberButtonState extends ConsumerState<CertificationNumberButton> {
  final TextEditingController _credentialController = TextEditingController();

  String _verificationId = '';
  late final FirebaseAuth _auth;

  @override
  Widget build(BuildContext context) {
    return _buildUI(ref);
  }

  @override
  void initState() {
    _auth = ref.read(authenticationProvider).getInstance();
    super.initState();
  }

  Widget _buildUI(WidgetRef ref) {
    final juc = ref.read(joinUserController);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          juc.authOk
              ? const SizedBox(child: Text('휴대폰 인증이 완료되었습니다.'))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Material(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(35, 204, 81, 1),
                          ),
                          child: const Text("인증받기", style: TextStyle(color: Colors.white)),
                        ),
                        onTap: () async {
                          FocusScope.of(context).unfocus();
                          String phoneNumber = juc.combinePhoneNumber();
                          await _buildVerifyPhoneNumber(phoneNumber);
                        },
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(widget.certificationText),
                      ),
                    ),
                  ],
                ),
          juc.authOk
              ? const SizedBox()
              : Visibility(
                  visible: widget.showCertificationBar,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Material(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.black, width: 0.5),
                              ),
                              child: const Text("입력하기")),
                          onTap: () async {
                            FocusScope.of(context).unfocus();
                            PhoneAuthCredential phoneAuthCredential =
                                PhoneAuthProvider.credential(verificationId: _verificationId, smsCode: _credentialController.text);
                            signInWithPhoneAuthCredential(phoneAuthCredential, juc);
                          },
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 50,
                          child: TextFormField(
                            controller: _credentialController,
                            autovalidateMode: AutovalidateMode.always,
                            maxLength: 6,
                            decoration: const InputDecoration(hintText: '인증번호 6자리를 입력해주세요'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  Future<void> _buildVerifyPhoneNumber(String phoneNumber) {
    return _auth.verifyPhoneNumber(
      phoneNumber: '+82 ${phoneNumber}', //${widget.phoneNumber}
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
          _verificationId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential, juc) async {
    try {
      final authCredential = await _auth.signInWithCredential(phoneAuthCredential);
      if (authCredential.user != null) {
        juc.authOk = true;
        widget.showCertificationBar = false;
        juc.checkAuth();
        setState(
          () {},
        );
        await _auth.currentUser!.delete();
        _auth.signOut();
      }
    } on FirebaseAuthException catch (e) {
      await Fluttertoast.showToast(
          msg: e.message as String, toastLength: Toast.LENGTH_SHORT, timeInSecForIosWeb: 1, backgroundColor: Colors.red, fontSize: 16.0);
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
