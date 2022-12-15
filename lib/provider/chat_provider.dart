import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/chats/model/chats.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/service/firebase_service.dart';

final chatPageProvider = Provider((ref) => ChatPageProvider('', ref));

class ChatPageProvider extends ChangeNotifier {
  List<ChatMessage>? messages;

  String _chatId;

  late StreamSubscription _messagesStream;

  String? _message;

  final Ref _ref;

  String get message {
    return message;
  }

  void set message(String _value) {
    _message = _value;
  }

  ChatPageProvider(this._chatId, this._ref) {
    listenToMessages();
  }

  @override
  void dispose() {
    _messagesStream.cancel();
    super.dispose();
  }

  void listenToMessages() {
    final _db = _ref.read(databaseService);
    try {
      _messagesStream = _db.streamMessagesForChat(_chatId).listen((_snapshot) {
        List<ChatMessage> _messsages = _snapshot.docs.map((_m) {
          Map<String, dynamic> _messageData = _m.data() as Map<String, dynamic>;
          return ChatMessage.fromJSON(_messageData);
        }).toList();
        messages = _messsages;
        notifyListeners();
      });
    } catch (e) {
      print('메세지에서 에러 발생');
      print(e);
    }
  }

  void sendTextMessge() {
    final _db = _ref.read(databaseService);
    if (_message != null) {
      ChatMessage _messageToSend = ChatMessage(
        content: _message!,
        type: MessageType.TEXT,
        senderID: UserSession.user.uid,
        sentTime: Timestamp.fromDate(DateTime.now()),
      );
      _db.addMessageToChat(_chatId, _messageToSend);
    }
  }
}
