// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:ggamf_front/controller/party/create_party_controller.dart';
// import 'package:ggamf_front/controller/user/join_user_controller.dart';
// import 'package:ggamf_front/domain/party/model/generate_room_party.dart';
// import 'package:ggamf_front/domain/user/model/join_user.dart';
//
// final createPartyViewModel =
// StateNotifierProvider<CreatePartyViewModel, JoinUser>((ref) {
//   final cpc = ref.read(createPartyController);
//   return CreatePartyViewModel(
//       GenerateRoomParty(userId: ,gameCodeId: ,gameName: ,roomName: ,totalPeople: ,),
//       ref);
// });
//
// class CreatePartyViewModel extends StateNotifier<JoinUser> {
//   final _ref;
//   CreatePartyViewModel(super.state, this._ref);
//
//   void updateState() {
//     final juc = _ref.read(joinUserController);
//     state = JoinUser(
//       name: juc.nameController.text,
//       loginId: juc.idController.text,
//       password: juc.passwordController.text,
//       phoneNumber: juc.combinePhoneNumber(),
//       nickname: juc.nickNameController.text,
//       email: juc.emailController.text,
//       isAgree: juc.isAgree,
//     );
//   }
// }
