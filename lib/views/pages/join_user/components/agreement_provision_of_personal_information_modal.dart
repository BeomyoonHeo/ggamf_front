import 'package:flutter/material.dart';
import 'package:ggamf_front/views/pages/join_user/agreement_user_form/agreement_user_form.dart';

class AgreementProvisionOfPersonalInformationModal extends StatefulWidget {
  const AgreementProvisionOfPersonalInformationModal({
    Key? key,
  }) : super(key: key);

  @override
  State<AgreementProvisionOfPersonalInformationModal> createState() =>
      _AgreementProvisionOfPersonalInformationModalState();
}

class _AgreementProvisionOfPersonalInformationModalState
    extends State<AgreementProvisionOfPersonalInformationModal> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(9)),
      padding: const EdgeInsets.all(15),
      child: ElevatedButton(
        onPressed: () {
          _buildShowModalBottomSheet(context, size);
        },
        style: const ButtonStyle(
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: 5,
            ),
          ),
          backgroundColor: MaterialStatePropertyAll(Colors.white),
          foregroundColor: MaterialStatePropertyAll(Colors.black),
        ),
        child: Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: null,
            ),
            const Text(
              '개인정보 활용 및 처리에 동의합니다.',
              style: TextStyle(fontFamily: 'NanumSquare', fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _buildShowModalBottomSheet(BuildContext context, Size size) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, builderSetState) {
          return SizedBox(
            height: size.height * 0.9,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text('개인정보 제공 동의서'),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const AgreementUserForm(),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      builderSetState(() {
                        setState(() {
                          isChecked = !isChecked;
                          Navigator.pop(context);
                        });
                      });
                    },
                    style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                      ),
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                      foregroundColor: MaterialStatePropertyAll(Colors.black),
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: null,
                        ),
                        const Expanded(
                          child: Text(
                            '위의 개인정보 수집 및 취급 방침에 동의합니다.',
                            style: TextStyle(
                                fontFamily: 'NanumSquare', fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
