import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/controller/user/join_user_controller.dart';
import 'package:ggamf_front/main.dart';
import 'package:ggamf_front/utils/validator_util.dart';
import 'package:ggamf_front/views/pages/join_user/components/agreement_provision_of_personal_information_modal.dart';
import 'package:ggamf_front/views/pages/join_user/components/certification_number_button.dart';
import 'package:ggamf_front/views/pages/join_user/components/confirm_join_user_button.dart';
import 'package:ggamf_front/views/pages/join_user/components/email_dropdown_button.dart';
import 'package:ggamf_front/views/pages/join_user/components/input_box.dart';
import 'package:ggamf_front/views/pages/join_user/components/input_email_box.dart';
import 'package:ggamf_front/views/pages/join_user/components/input_phonenumber_widget.dart';
import 'package:ggamf_front/views/pages/join_user/join_user_view_model.dart';

class JoinUserView extends ConsumerStatefulWidget {
  const JoinUserView({Key? key}) : super(key: key);

  @override
  ConsumerState<JoinUserView> createState() => _JoinUserViewState();
}

class _JoinUserViewState extends ConsumerState<JoinUserView> {
  @override
  void initState() {
    ref.refresh(joinUserViewModel);
    ref.refresh(joinUserController);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    ref.invalidate(joinUserController);
    ref.read(joinUserViewModel.notifier).keepAlive.close();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return _buildUI(ref);
      },
    );
  }

  Widget _buildUI(WidgetRef ref) {
    final juc = ref.read(joinUserController);
    Function passwordRepeatValidation() {
      return (String? value) {
        if (juc.passwordController.text != value) {
          return '기존 패스워드와 같지 않습니다.';
        } else {
          return null;
        }
      };
    }

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(navigatorKey.currentState!.context);
          },
        ),
        title: const Text('회원가입 페이지'),
      ),
      body: Container(
        width: double.infinity,
        //color: const Color.fromRGBO(35, 204, 81, 1),
        child: Form(
          key: juc.formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InputBox(validator: nameValidator, inputText: "이름   : ", hintText: "이름을 입력하세요", controller: juc.nameController),
                  const SizedBox(height: 10),
                  InputBox(validator: idValidator, inputText: "아이디   : ", hintText: "아이디를 입력하세요", controller: juc.idController),
                  const SizedBox(height: 10),
                  InputBox(
                      obsText: true,
                      validator: passwordValidator,
                      inputText: "비밀번호   : ",
                      hintText: "비밀번호를 입력하세요",
                      controller: juc.passwordController),
                  const SizedBox(height: 10),
                  InputBox(
                      obsText: true,
                      autoValidateMode: AutovalidateMode.always,
                      validator: passwordRepeatValidation,
                      inputText: "비밀번호 확인   : ",
                      hintText: "비밀번호를 입력하세요",
                      controller: null),
                  const SizedBox(height: 10),
                  InputPhoneNumberWidget(
                    controller: juc.phoneNumberController,
                  ),
                  const SizedBox(height: 10),
                  CertificationNumberButton(certificationText: '인증되지 않음'),
                  const SizedBox(height: 10),
                  InputBox(
                    validator: nickNameValidator,
                    inputText: "닉네임   : ",
                    hintText: "닉네임 입력",
                    controller: juc.nickNameController,
                  ),
                  const SizedBox(height: 10),
                  InputEmailBox(
                    controller: juc.emailController,
                    validator: emailValidator,
                  ),
                  const SizedBox(height: 10),
                  const EmailDropdownButton(),
                  const SizedBox(height: 10),
                  const AgreementProvisionOfPersonalInformationModal(),
                  const SizedBox(height: 10),
                  const ConfirmJoinUserButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
