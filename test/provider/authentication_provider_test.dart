import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';

Future<void> main() async {
  //WidgetsFlutterBinding.ensureInitialized();

  // final FirebaseApp app = await FirebaseApp.configure(
  //   name: 'test',
  //   options: const FirebaseOptions(
  //     googleAppID:
  //         '1:392355264503:android:868e23171f6e18d23560f2', // 1:392355264503:android:868e23171f6e18d23560f2
  //     gcmSenderID: '392355264503',
  //     apiKey:
  //         'AIzaSyDP14pVPuc6wQ5T_dWzfD7PZsIW_7WAqd4', // AIzaSyDP14pVPuc6wQ5T_dWzfD7PZsIW_7WAqd4
  //     projectID: 'ggamf-chat-front',
  //   ),
  // );
}

Future<void> _setup() async {
  await Firebase.initializeApp();
}

Future<String?> registerUserUsingEmailAndPassword(
    String _email, String _password) async {
  final auth = FirebaseAuth.instance;
  try {
    auth.signOut();
    UserCredential _credential = await auth.createUserWithEmailAndPassword(
        email: _email, password: _password);
    return _credential.user!.uid;
  } on FirebaseAuthException catch (e) {
    Logger().d(e);
  } catch (e) {
    Logger().d(e);
  }
  return null;
}
