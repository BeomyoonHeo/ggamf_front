import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/controller/user/join_user_controller.dart';

class ConfirmJoinUserButton extends ConsumerWidget {
  final GlobalKey<FormState> formKey;
  ConfirmJoinUserButton({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final juc = ref.read(joinUserController);
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(9)),
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {}
              },
              child: Text('회원가입'),
              style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.black),
                backgroundColor: MaterialStatePropertyAll(Colors.white),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(width: 1),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
