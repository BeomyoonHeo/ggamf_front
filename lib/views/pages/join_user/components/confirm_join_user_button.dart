import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/controller/user/join_user_controller.dart';

class ConfirmJoinUserButton extends ConsumerWidget {
  const ConfirmJoinUserButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final juc = ref.read(joinUserController);
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
                if (juc.formKey.currentState!.validate()) {
                  Navigator.pop(context);
                }
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
