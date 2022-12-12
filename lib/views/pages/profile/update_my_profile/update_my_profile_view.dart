import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/controller/user/my_profile_controller.dart';
import 'package:ggamf_front/views/pages/profile/my_profile/my_profile_view_model.dart';
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
  final _nickname = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _introduce = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //mpc = myProfileController
    final mpc = ref.read(myProfileController);
    //mpvm = myProfileViewModel
    final mpvm = ref.watch(myProfileViewModel);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            SizedBox(height: 50),
            _changePhoto(),
            SizedBox(height: 50),
            _enterNickName(),
            SizedBox(height: 30),
            _enterPassword(),
            SizedBox(height: 30),
            _enterEmail(),
            SizedBox(height: 30),
            _enterIntroduce(),
            SizedBox(height: 30),
            _updateProfileButton(mpc),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Container _enterEmail() {
    return Container(
      padding: EdgeInsets.all(5),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: TextFormField(
        controller: _email,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "이메일을 입력하세요",
        ),
      ),
    );
  }

  Container _enterPassword() {
    return Container(
      padding: EdgeInsets.all(5),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: TextFormField(
        controller: _password,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "비밀번호를 입력하세요",
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          BackButton(color: Colors.black),
          Text("내 프로필 수정", style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }

  Column _changePhoto() {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("assets/images/20.jpg"),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(context: context, builder: (builder) => _bottomSheet());
                  },
                  child: Icon(
                    Icons.camera_alt,
                    size: 25,
                  ),
                ))
          ],
        ),
      ],
    );
  }

  Widget _updateProfileButton(MyProfileController mpc) {
    return Container(
      padding: EdgeInsets.only(left: 100, right: 100),
      child: OutlinedButton(
        onPressed: () async {},
        child: Text("수정 완료"),
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          minimumSize: Size(150, 50),
        ),
      ),
    );
  }

  Widget _enterIntroduce() {
    return Container(
      padding: EdgeInsets.all(5),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: TextFormField(
        controller: _introduce,
        keyboardType: TextInputType.multiline,
        maxLines: 5,
        minLines: 1,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "자기소개를 입력하세요",
        ),
      ),
    );
  }

  Widget _enterNickName() {
    return Container(
      padding: EdgeInsets.all(5),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: TextFormField(
        controller: _nickname,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "닉네임을 입력하세요",
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
            "choose Profile photo",
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
