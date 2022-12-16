import 'package:ggamf_front/domain/user/model/chat_user.dart';
import 'package:ggamf_front/domain/user/model/user.dart';

import 'chat_message.dart';

class Chat {
  final String id;
  final int totalPeople;
  final List<ChatUser> memebers;
  List<ChatMessage> messages;
  late final List<ChatUser> _recepients;

  Chat({
    required this.id,
    required this.memebers,
    required this.messages,
    required this.totalPeople,
  }) {
    _recepients =
        memebers.where((_i) => _i.uid != UserSession.user.uid).toList();
  }
  List<ChatUser> recepients() {
    return _recepients;
  }
}
