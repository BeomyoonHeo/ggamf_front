import 'package:flutter/material.dart';

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
      padding: EdgeInsets.all(15),
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            builder: (BuildContext context) {
              return StatefulBuilder(
                  builder: (BuildContext context, builderSetState) {
                return Container(
                  height: size.height * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text('개인정보 제공 동의서'),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text('  본인은 개인정보 보호법 제15조에 의거하여 본인의 개인정보를 제공할 것을 동의합니다.\n' +
                              '<개인정보 수집 안내>\n' +
                              '○ 개인정보의 수집의 목적\n' +
                              '- 본인 확인절차\n' +
                              '- 고지사항 전달, 불만 처리 등을 위한 원활한 의사소통 경로의 확보, 모집결과 등의 안내\n' +
                              '- 각종 우편물 발생시 정확한 배송지의 확보\n' +
                              '- 모집여부 판단을 위한 기본 정보 확보\n' +
                              '- 경찰서, 등록기준지에 제공하여 신원조사 및 신원조회 실시\n' +
                              '○ 개인정보 수집 항목' +
                              '- 성명, 생년월일, 사진, 이메일 주소, 전화번호 (휴대폰, 전화번호), 주소,\n' +
                              '○ 개인정보 보유기간\n' +
                              '- 개인정보 보호법에 의거 법률로 정한 목적 이외의 다른 어떠한 목적으로도 사용되지 않으며 내부 규정에 의해 일정 기간 저장된 후 파기\n' +
                              '○ 동의하지 않을 경우의 처리\n' +
                              '- 이용자는 개인정보 수집 및 제공 동의에 거부할 수 있으며, 이 경우 채용 절차(사실 확인 등)가 제한됨으로 채용상 불이익을 초래할 수  있습니다.\n'),
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
                          child: Row(
                            children: [
                              Checkbox(
                                value: isChecked,
                                onChanged: null,
                              ),
                              Text(
                                '위의 개인정보 수집 및 취급 방침에 동의합니다.',
                                style: TextStyle(
                                    fontFamily: 'NanumSquare', fontSize: 14),
                              ),
                            ],
                          ),
                          style: ButtonStyle(
                            padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                            ),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white),
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
            },
          );
        },
        child: Row(
          children: [
            Checkbox(
              value: isChecked,
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
          foregroundColor: MaterialStatePropertyAll(Colors.black),
        ),
      ),
    );
  }
}
