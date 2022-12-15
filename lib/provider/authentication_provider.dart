import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ggamf_front/utils/validator_util.dart';

class AuthenticationProvider extends ChangeNotifier {
  late final FirebaseAuth _auth;

  Future<String?> registerUserUsingEmailAndPassword(
      String _email, String _password) async {
    _auth = FirebaseAuth.instance;
    try {
      UserCredential _credential = await _auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      return _credential.user!.uid;
    } on FirebaseAuthException catch (e) {
      logger.d('회원가입 도중 에러 발생');
      Fluttertoast.showToast(msg: e.code);
    } catch (e) {
      logger.d(e);
    }
    return null;
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      logger.d(e);
    }
  }

  AuthenticationProvider() {
    _auth = FirebaseAuth.instance;

    _auth.authStateChanges().listen((_user) {
      if (_user != null) {
      } else {}
    });
  }

  Future<void> loginUsingEmailAndPassword(
      String _email, String _password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      print(_auth.currentUser);
    } on FirebaseAuthException {
      print('Error Logging user into Firebase');
    } catch (e) {
      print(e);
    }
  }
}
