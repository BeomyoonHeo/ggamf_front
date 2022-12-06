import 'package:flutter/material.dart';

class CertificationNumberButton extends StatelessWidget {
  CertificationNumberButton({
    Key? key,
  }) : super(key: key);

  bool authOk = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(9)),
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            child: Text("인증받기"),
            onPressed: () {},
            style: ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(Colors.black),
              backgroundColor: MaterialStatePropertyAll(Colors.white),
              padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 30)),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(width: 1),
                ),
              ),
            ),
          ),
          Text('인증되지 않았습니다.'),
        ],
      ),
    );
  }
}
