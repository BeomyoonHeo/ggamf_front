import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/party/repository/room_repository.dart';
import 'package:ggamf_front/main.dart';
import 'package:ggamf_front/provider/chats_page_provider.dart';
import 'package:ggamf_front/utils/custom_intercepter.dart';

import '../../provider/chat_provider.dart';
import '../../views/pages/chatting/chatting_view.dart';

final partyController = Provider((ref) => PartyController(ref));

class PartyController {
  final Ref _ref;

  final RoomRepository repo = RoomRepository(Dio()
    ..interceptors.add(CustomLogInterceptor())
    ..interceptors.add(SignedInterceptor()));

  PartyController(this._ref);
  void enterParty({required int roomId}) {
    navigatorKey.currentState?.push(MaterialPageRoute(builder: (context) {
      _ref.read(chatPageProvider.notifier).setChatId(roomId.toString());
      return ChatPage(
          chat: _ref
              .read(chatsPageProvider)
              .singleWhere((_chat) => _chat.id == roomId.toString()));
    }));
  }
}
