import 'package:flutter/material.dart';

class AgreementUserForm extends StatelessWidget {
  const AgreementUserForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
        '  본인은 개인정보 보호법 제15조에 의거하여 본인의 개인정보를 제공할 것을 동의합니다.\n<개인정보 수집 안내>\n○ 개인정보의 수집의 목적\n- 본인 확인절차\n- 고지사항 전달, 불만 처리 등을 위한 원활한 의사소통 경로의 확보, 모집결과 등의 안내\n- 각종 우편물 발생시 정확한 배송지의 확보\n- 모집여부 판단을 위한 기본 정보 확보\n- 경찰서, 등록기준지에 제공하여 신원조사 및 신원조회 실시\n○ 개인정보 수집 항목- 성명, 생년월일, 사진, 이메일 주소, 전화번호 (휴대폰, 전화번호), 주소,\n○ 개인정보 보유기간\n- 개인정보 보호법에 의거 법률로 정한 목적 이외의 다른 어떠한 목적으로도 사용되지 않으며 내부 규정에 의해 일정 기간 저장된 후 파기\n○ 동의하지 않을 경우의 처리\n- 이용자는 개인정보 수집 및 제공 동의에 거부할 수 있으며, 이 경우 서비스 가입이 불가함을 고지합니다.\n');
  }
}
