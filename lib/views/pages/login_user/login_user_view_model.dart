import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginUserViewModel =
    StateNotifierProvider((ref) => LoginUserViewModel(null));

class LoginUserViewModel extends StateNotifier {
  LoginUserViewModel(super.state);

  init() {
    state = this;
  }
}
