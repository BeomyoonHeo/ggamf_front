import 'package:validators/validators.dart';

Function nameValidator() {
  return (String? value) {
    if (value!.isEmpty) {
      return '이름은 필수사항입니다.';
    }
    if (value.length < 2) {
      return '이름은 두글자 이상 입력 해주셔야합니다.';
    } else {
      return null;
    }
  };
}

Function emailValidator() {
  return (String? value) {
    if (value!.isEmpty) {
      return "이메일은 공백이 들어갈 수 없습니다.";
    } else if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return "이메일 형식에 맞지 않습니다.";
    } else {
      return null;
    }
  };
}

Function emailDomainValidator() {
  return (String? value) {
    if (value!.isEmpty) {
      return "이메일은 공백이 들어갈 수 없습니다.";
    } else if (!RegExp(
            r'^((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)) {
      return "이메일 형식에 맞지 않습니다.";
    } else {
      return null;
    }
  };
}

Function passwordValidator() {
  return (String? value) {
    if (value!.isEmpty) {
      return "패스워드에 공백이 들어갈 수 없습니다.";
    } else if (value.length > 16) {
      return "패스워드가 16자리를 초과하였습니다.";
    } else if (value.length < 4) {
      return "패스워드의 최소 길이는 4자입니다.";
    } else {
      return null;
    }
  };
}

Function nickNameValidator() {
  return (String? value) {
    if (value!.isEmpty) {
      return '닉네임은 필수사항입니다.';
    }
    if (value.length < 8) {
      return '닉네임은 8자 이상 입력해주세요!';
    } else {
      return null;
    }
  };
}

Function idValidator() {
  return (String? value) {
    if (value!.isEmpty) {
      return "아이디는 필수 사항입니다.";
    } else if (!isAlphanumeric(value)) {
      return "아이디에 한글이나 특수 문자가 들어갈 수 없습니다.";
    } else if (value.length > 12) {
      return "아이디에 길이를 초과하였습니다.";
    } else if (value.length < 3) {
      return "아이디에 최소 길이는 3자입니다.";
    } else {
      return null;
    }
  };
}
