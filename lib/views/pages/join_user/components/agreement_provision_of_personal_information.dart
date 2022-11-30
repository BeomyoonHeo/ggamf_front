import 'package:flutter/material.dart';

class AgreementProvisionOfPersonalInformation extends StatefulWidget {
  const AgreementProvisionOfPersonalInformation({
    Key? key,
  }) : super(key: key);

  @override
  State<AgreementProvisionOfPersonalInformation> createState() =>
      _AgreementProvisionOfPersonalInformationState();
}

class _AgreementProvisionOfPersonalInformationState
    extends State<AgreementProvisionOfPersonalInformation> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(9)),
      padding: EdgeInsets.all(15),
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            builder: (context) {
              return Container(
                height: size.height * 0.9,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Row(
          children: [
            Checkbox(
              value: false,
              onChanged: null,
            ),
            Text(
              '개인정보 활용 및 처리에 동의합니다.',
              style: TextStyle(fontFamily: 'NanumSquare', fontSize: 14),
            ),
          ],
        ),
        style: ButtonStyle(
            padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(
                horizontal: 5,
              ),
            ),
            backgroundColor: MaterialStatePropertyAll(Colors.white),
            foregroundColor: MaterialStatePropertyAll(Colors.black)),
      ),
    );
  }
}
