import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/controller/user/user_controller.dart';
import 'package:ggamf_front/utils/page_enum.dart';
import 'package:ggamf_front/utils/validator_util.dart';
import 'package:ggamf_front/views/pages/login_user/components/rounded_input_field.dart';
import 'package:ggamf_front/views/pages/login_user/components/rounded_input_password_field.dart';

class LoginBox extends ConsumerWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  LoginBox({
    required this.usernameController,
    required this.passwordController,
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final luc = ref.read(userController);
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        color: Colors.white,
        width: size.width * 0.9,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: _buildLoginItemColumn(context, luc),
      ),
    );
  }

  Widget _buildLoginItemColumn(context, UserController luc) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          // decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //         colors: [Color.fromRGBO(35, 204, 81, 0.9), Color.fromRGBO(35, 204, 81, 1)],
          //         begin: Alignment.centerLeft,
          //         end: Alignment.centerRight,
          //         tileMode: TileMode.clamp),
          //     border: Border.all(width: 1),
          //     borderRadius: BorderRadius.circular(9)),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Column(
            children: [
              RoundedInputField(
                validator: idValidator,
                controller: usernameController,
                icon: Icons.person,
                hintText: "???????????????",
                onChanged: (value) {},
              ),
              const SizedBox(height: 10),
              RoundedInputPasswordField(controller: passwordController, validator: passwordValidator),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              ItemButton(
                  text: "?????????",
                  function: () {
                    luc.login(usernameController.text, passwordController.text);
                  }),
              const SizedBox(height: 10),
              ItemButton(
                  text: "????????????",
                  function: () {
                    Navigator.pushNamed(context, PageEnum.getByDisPlayName('join').requestLocation);
                  }),
              const SizedBox(height: 10),
              ItemButton(
                text: "?????????|??????????????????",
                function: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ItemButton extends StatefulWidget {
  final text;

  final Function function;
  const ItemButton({
    Key? key,
    this.text,
    required this.function,
  }) : super(key: key);

  @override
  State<ItemButton> createState() => _ItemButtonState();
}

class _ItemButtonState extends State<ItemButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () {
          Future.delayed(const Duration(milliseconds: 500)).then((value) => widget.function());
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color.fromRGBO(35, 204, 81, 1)),
          child: Text(
            widget.text,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
