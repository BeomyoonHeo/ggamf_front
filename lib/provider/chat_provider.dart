import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/chats/model/chat_message.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/service/database_service.dart';
import 'package:ggamf_front/utils/validator_util.dart';

final chatPageProvider =
    StateNotifierProvider.autoDispose<ChatPageProvider, List<ChatMessage>>(
        (ref) => ChatPageProvider('', ref));

class ChatPageProvider extends StateNotifier<List<ChatMessage>> {
  List<ChatMessage>? messages;

  String _chatId;

  late StreamSubscription _messagesStream;

  String? _message;

  final Ref _ref;

  String get message {
    return message;
  }

  set message(String _value) {
    _message = _value;
  }

  void setChatId(String _value) {
    _chatId = _value;
    logger.d('메세지 데이터 확인 : ${_chatId}');
  }

  ChatPageProvider(this._chatId, this._ref) : super([]);

  @override
  void dispose() {
    _messagesStream.cancel();
    super.dispose();
  }

  void listenToMessages() {
    final _db = _ref.read(databaseService);
    try {
      logger.d('메세지 데이터 확인 : ${_chatId}');
      _messagesStream = _db.streamMessagesForChat(_chatId).listen((_snapshot) {
        List<ChatMessage> _messsages = _snapshot.docs.map((_m) {
          Map<String, dynamic> _messageData = _m.data() as Map<String, dynamic>;
          logger.d('메세지 데이터 확인 : ${_m.data()}');
          return ChatMessage.fromJSON(_messageData);
        }).toList();
        messages = _messsages;
      });
    } catch (e) {
      logger.d('메세지에서 에러 발생');
      logger.d(e);
    }
  }

  void sendTextMessge() {
    final _db = _ref.read(databaseService);
    if (_message != null) {
      ChatMessage _messageToSend = ChatMessage(
        content: _message!,
        type: MessageType.TEXT,
        senderID: UserSession.user.uid,
        sentTime: Timestamp.fromDate(DateTime.now()).toString(),
      );
      _db.addMessageToChat(_chatId, _messageToSend);
    }
  }
}
