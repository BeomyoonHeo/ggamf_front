import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/controller/user/join_user_controller.dart';
import 'package:ggamf_front/views/pages/join_user/join_user_view_model.dart';

class InputPhoneNumberWidget extends ConsumerWidget {
  final List<TextEditingController> controller;
  const InputPhoneNumberWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final juc = ref.read(joinUserController);
    final jvm = ref.watch(joinUserViewModel);
    return juc.authOk
        ? const SizedBox()
        : Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(9)),
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "전화번호 : ",
                  style: TextStyle(fontSize: 15),
                ),
                _buildCustomTextFormField(controller[0], 3),
                const Text(
                  " - ",
                  style: TextStyle(fontSize: 15),
                ),
                _buildCustomTextFormField(controller[1], 4),
                const Text(
                  " - ",
                  style: TextStyle(fontSize: 15),
                ),
                _buildCustomTextFormField(controller[2], 4),
              ],
            ),
          );
  }

  Widget _buildCustomTextFormField(
      TextEditingController controller, int maxLength) {
    return SizedBox(
      height: 30,
      width: 70,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: maxLength,
        decoration: const InputDecoration(
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          fillColor: Colors.white,
          border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
          counterText: '',
        ),
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}
