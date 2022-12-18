import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/controller/user/my_profile_controller.dart';
import 'package:ggamf_front/domain/user/model/profile_user.dart';
import 'package:ggamf_front/utils/validator_util.dart';
import 'package:ggamf_front/views/pages/profile/my_profile/my_profile_view_model.dart';
import 'package:ggamf_front/views/pages/profile/update_my_profile/update_my_profile_view_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/color.dart';

class UpdateMyProfileView extends ConsumerStatefulWidget {
  const UpdateMyProfileView({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _UpdateMyProfileViewState();
}

class _UpdateMyProfileViewState extends ConsumerState<UpdateMyProfileView> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  void _pickIamgeBase64() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    List<int> imagebyte = await image!.readAsBytes();
    String _base64 = base64Encode(imagebyte);

    logger.d(_base64);

    final imagePath = File(image.path);
    print(imagePath);
    setState(() {
      this._imageFile = imagePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    //mpc = myProfileController
    final mpc = ref.read(myProfileController);
    //mpvm = myProfileViewModel
    final mpvm = ref.watch(myProfileViewModel);
    final umpvm = ref.watch(updateMyProfileViewModel);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width / 2 + 95,
                child: Stack(
                  children: [
                    Container(
                      height: 250,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color.fromRGBO(35, 204, 81, 0.9), Color.fromRGBO(35, 204, 81, 1)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              tileMode: TileMode.clamp),
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
                    ),
                    _choosephoto(mpvm, context),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _enterNickName(mpc),
              const SizedBox(height: 30),
              _enterPassword(mpc),
              const SizedBox(height: 30),
              _enterEmail(mpc),
              const SizedBox(height: 30),
              _enterIntroduce(mpc),
              const SizedBox(height: 30),
              _updateProfileButton(mpc),
            ],
          ),
        ),
      ),
    );
  }

  Row _choosephoto(ProfileUser mpvm, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Stack(
            children: [
              CircleAvatar(
                radius: 60.0,
                child: ClipRRect(
                  child: mpvm.intro!.isEmpty
                      ? Image.asset("assets/images/generic-avatar.svg")
                      : Image.memory((Uri.parse(mpvm.photo ?? '').data!.contentAsBytes())),
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(context: context, builder: (builder) => _bottomSheet());
                  },
                  child: const Icon(
                    Icons.camera_alt,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container _enterEmail(MyProfileController mpc) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: TextFormField(
        controller: mpc.emailController,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "이메일을 입력하세요",
          suffixIcon: Icon(CupertinoIcons.pen),
        ),
      ),
    );
  }

  Container _enterPassword(MyProfileController mpc) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: TextFormField(
        controller: mpc.passwordController,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "비밀번호를 입력하세요",
          suffixIcon: Icon(CupertinoIcons.pen),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Row(
        children: const [
          BackButton(color: Colors.black),
          Text("내 프로필 수정", style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }

  Widget _updateProfileButton(MyProfileController mpc) {
    return ElevatedButton(
      onPressed: () async {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromRGBO(35, 204, 81, 1),
        minimumSize: const Size(150, 50),
      ),
      child: const Text("수정 완료", style: TextStyle(fontSize: 20)),
    );
  }

  Widget _enterIntroduce(MyProfileController mpc) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: TextFormField(
        controller: mpc.introduceController,
        keyboardType: TextInputType.multiline,
        maxLines: 5,
        minLines: 1,
        textInputAction: TextInputAction.done,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "자기소개를 입력하세요",
          suffixIcon: Icon(CupertinoIcons.pen),
        ),
      ),
    );
  }

  Widget _enterNickName(MyProfileController mpc) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: TextFormField(
        controller: mpc.nicknameController,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "닉네임을 입력하세요",
          suffixIcon: Icon(CupertinoIcons.pen),
        ),
      ),
    );
  }

  Widget _bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text(
            "사진을 선택하세요",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                icon: Icon(Icons.camera),
                label: Text(
                  "Camera",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                icon: Icon(Icons.photo_library),
                label: Text(
                  "Gallery",
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Future takePhoto(ImageSource source) async {
    final image = await _picker.pickImage(source: source);
    setState(() {
      _imageFile = File(image!.path);
    });
  }
}
// Widget _changePhoto() {
//   return Column(
//     children: [
//       Stack(
//         children: [
//           const CircleAvatar(
//             radius: 60,
//             backgroundImage: AssetImage("assets/images/20.jpg"),
//           ),
//           Positioned(
//               bottom: 0,
//               right: 0,
//               child: InkWell(
//                 onTap: () {
//                   showModalBottomSheet(context: context, builder: (builder) => _bottomSheet());
//                 },
//                 child: const Icon(
//                   Icons.camera_alt,
//                   size: 25,
//                 ),
//               ))
//         ],
//       ),
//     ],
//   );
// }
