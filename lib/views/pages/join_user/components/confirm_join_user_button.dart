import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/controller/user/join_user_controller.dart';
import 'package:ggamf_front/utils/validator_util.dart';
import 'package:ggamf_front/views/pages/join_user/join_user_view_model.dart';

class ConfirmJoinUserButton extends ConsumerWidget {
  const ConfirmJoinUserButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final juc = ref.read(joinUserController);
    final jvm = ref.watch(joinUserViewModel);
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(9)),
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {
                if (juc.formKey.currentState!.validate() &&
                    juc.authOk &&
                    juc.isAgree) {}
                juc.requestJoin();
                logger.d('벨리데이션 : ${juc.formKey.currentState!.validate()}');
                logger.d('authOK? ${juc.authOk}');
                logger.d('동의 ? ${juc.isAgree}');
              },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 0.7)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: const Text('회원가입')),
            ),
          )
        ],
      ),
    );
  }
}
