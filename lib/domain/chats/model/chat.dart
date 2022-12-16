import 'package:ggamf_front/domain/user/model/chat_user.dart';

import 'chat_message.dart';

class Chat {
  final String uid;
  final String currentUserUid;
  final bool activity;
  final bool group;
  final List<ChatUser> memebers;
  List<ChatMessage> messages;
  late final List<ChatUser> _recepients;

  Chat({
    required this.uid,
    required this.currentUserUid,
    required this.activity,
    required this.group,
    required this.memebers,
    required this.messages,
  }) {
    _recepients = memebers.where((_i) => _i.uid != currentUserUid).toList();
  }
  List<ChatUser> recepients() {
    return _recepients;
  }

  String title() {
    return !group
        ? _recepients.first.name
        : _recepients.map((_user) => _user.name).join(', ');
  }

  String imageURL() {
    return !group
        ? _recepients.first.imageURL
        : "https://e7.pngegg.com/pngimages/380/670/png-clipart-group-chat-logo-blue-area-text-symbol-metroui-apps-live-messenger-alt-2-blue-text.png";
  }
}
