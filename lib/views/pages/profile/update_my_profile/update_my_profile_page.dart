import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/color.dart';
import '../../../common_components/bottom_navigator.dart';

class UpdateMyProfilePage extends StatefulWidget {
  const UpdateMyProfilePage({Key? key}) : super(key: key);

  @override
  State<UpdateMyProfilePage> createState() => _UpdateMyProfilePageState();
}

class _UpdateMyProfilePageState extends State<UpdateMyProfilePage> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            _changePhoto(),
            SizedBox(height: 50),
            _nickName(),
            SizedBox(height: 50),
            _introduce(),
            SizedBox(height: 50),
            _updateProfileButton(),
            SizedBox(height: 50),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigator(),
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

  Widget _updateProfileButton() {
    return Container(
      padding: EdgeInsets.only(left: 100, right: 100),
      child: ElevatedButton(
        onPressed: () {},
        child: Text("수정 완료"),
        style: ElevatedButton.styleFrom(
          backgroundColor: kSecondaryColor,
        ),
      ),
    );
  }

  Widget _introduce() {
    return Container(
      height: 150,
      margin: EdgeInsets.only(left: 20, right: 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            blurRadius: 5,
            spreadRadius: 0,
            offset: Offset(5, 6),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: TextField(
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

  Widget _nickName() {
    return Container(
      padding: EdgeInsets.all(15),
      width: 200,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            blurRadius: 5,
            spreadRadius: 0,
            offset: Offset(5, 6),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: TextField(
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
