import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/controller/user/join_user_controller.dart';
import 'package:ggamf_front/domain/user/model/join_user.dart';

final joinUserViewModel =
    StateNotifierProvider.autoDispose<JoinUserViewModel, JoinUser>((ref) {
  final KeepAliveLink keepAlive = ref.keepAlive();
  final juc = ref.read(joinUserController);
  return JoinUserViewModel(
      keepAlive,
      JoinUser(
        name: juc.nameController.text,
        loginId: juc.idController.text,
        password: juc.passwordController.text,
        phoneNumber: juc.combinePhoneNumber(),
        nickname: juc.nickNameController.text,
        email: juc.emailController.text,
        isAgree: juc.isAgree,
      ),
      ref);
});

class JoinUserViewModel extends StateNotifier<JoinUser> {
  final _ref;
  final KeepAliveLink keepAlive;
  JoinUserViewModel(this.keepAlive, super.state, this._ref);

  void updateState() {
    final juc = _ref.read(joinUserController);
    state = JoinUser(
      name: juc.nameController.text,
      loginId: juc.idController.text,
      password: juc.passwordController.text,
      phoneNumber: juc.combinePhoneNumber(),
      nickname: juc.nickNameController.text,
      email: juc.emailController.text,
      isAgree: juc.isAgree,
    );
  }
}
