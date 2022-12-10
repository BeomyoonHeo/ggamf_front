import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final joinUserController = Provider((ref) => JoinUserController());

class JoinUserController {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<TextEditingController> phoneNumberController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  TextEditingController nickNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String combinePhoneNumber() {
    String phoneNumber = '';
    phoneNumberController.forEach((_controller) {
      phoneNumber += '${_controller.text} ';
    });

    phoneNumber = phoneNumber.trim();

    return phoneNumber;
  }
}
