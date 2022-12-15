import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ggamf_front/utils/validator_util.dart';

import '../domain/user/model/chat_user.dart';

final authenticationProvider = Provider((ref) => AuthenticationProvider(ref));

class AuthenticationProvider extends ChangeNotifier {
  final Ref _ref;
  final auth = FirebaseAuth.instance;
  late ChatUser user;

  FirebaseAuth getInstance() {
    return auth;
  }

  Future<String?> registerUserUsingEmailAndPassword(
      String _email, String _password) async {
    try {
      auth.signOut();
      UserCredential _credential = await auth.createUserWithEmailAndPassword(
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
      await auth.signOut();
    } catch (e) {
      logger.d(e);
    }
  }

  AuthenticationProvider(this._ref);
//   {
//   final _databaseService = _ref.read(databaseService);
//
//   auth.authStateChanges().listen((_user) {
//   if (_user != null) {
//   _databaseService.updateUserLastSeenTime(_user.uid);
//   _databaseService.getUser(_user.uid).then(
//   (_snapshot) {
//   Map<String, dynamic> _userData =
//   _snapshot.data()! as Map<String, dynamic>;
//   user = ChatUser.fromJSON(
//   {
//   'uid': _user.uid,
//   'name': _userData['name'],
//   'email': _userData['email'],
//   'last_active': _userData['last_active'],
//   'image': _userData['image'],
//   },
//   );
//   Navigator.popAndPushNamed(navigatorKey.currentState!.context,
//   PageEnum.ALLPAGES.requestLocation);
//   },
//   );
//   } else {
//   Navigator.popAndPushNamed(
//   navigatorKey.currentState!.context, PageEnum.LOGIN.requestLocation);
//   }
//   });
// }

  Future<void> loginUsingEmailAndPassword(
      String _email, String _password) async {
    try {
      await auth.signInWithEmailAndPassword(email: _email, password: _password);
      print(auth.currentUser);
    } on FirebaseAuthException {
      print('Error Logging user into Firebase');
    } catch (e) {
      print(e);
    }
  }
}
