import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/chats/model/chat.dart';
import 'package:ggamf_front/domain/chats/model/chat_message.dart';
import 'package:ggamf_front/domain/user/model/chat_user.dart';
import 'package:ggamf_front/domain/user/model/user.dart';
import 'package:ggamf_front/utils/validator_util.dart';

import '../service/database_service.dart';

final chatsPageProvider =
    StateNotifierProvider<ChatsPageProvider, List<Chat>>((ref) {
  final dbService = ref.read(databaseService);

  return ChatsPageProvider(dbService, []);
});

class ChatsPageProvider extends StateNotifier<List<Chat>> {
  late DatabaseService _db;
  List<Chat>? chats;

  late StreamSubscription _chatsStream; // StreamSubscription으로 Stream을 제어함

  ChatsPageProvider(this._db, this.chats) : super([]) {
    getChats();
  }
  @override
  void dispose() {
    _chatsStream.cancel();
    super.dispose();
  }

  Future<void> createChat({required int id, required int totalPeople}) async {
    await _db
        .createChatRoom(
            roomId: id, ownerId: UserSession.user.uid, totalPeople: totalPeople)
        .then((value) => logger.d('방생성 완료!'));
  }

  Future<void> getChats() async {
    try {
      _chatsStream =
          _db.getChatsForUser(UserSession.user.uid).listen((_snapshot) async {
        state = await Future.wait(
          _snapshot.docs.map(
            (_d) async {
              logger.d('_userSnapshot.id = ${_d.data()}');
              Map<String, dynamic> _chatData =
                  _d.data() as Map<String, dynamic>;
              List<ChatUser> _members = [];
              //firebase에서 가져온 member collection을 전부 ChatUser로 치환하여 Object로 반환
              for (var _uid in _chatData['members']) {
                DocumentSnapshot _userSnapshot =
                    await _db.getUser(_uid); // 실제 db에서 유저 데이터 가져 옴
                logger.d('_uid= ${_userSnapshot.data()}');
                Map<String, dynamic> _userData = _userSnapshot.data() as Map<
                    String, dynamic>; // 가져온 유저 데이터를 <String, dynamic> 형태로 변환
                _members.add(
                  ChatUser.fromJson(_userData),
                );
              }
              List<ChatMessage> _messages = [];
              //채팅방에 뿌릴 메세지 데이터를 List로 받는다.
              QuerySnapshot _chatMessage =
                  await _db.getLastMessageForChat(_d.id);
              if (_chatMessage.docs.isNotEmpty) {
                // 마지막 메세지가 존재 할 경우
                Map<String, dynamic> _messageData =
                    _chatMessage.docs.first.data()! as Map<String, dynamic>;
                ChatMessage _message = ChatMessage.fromJSON(_messageData);
                _messages.add(_message);
              }
              return Chat(
                id: _d.id,
                totalPeople: _chatData['total_people'],
                memebers: _members,
                messages: _messages,
              );
            },
          ).toList(),
        ); // 데이터가 실시간으로 변하는 것을 감지하겠다 -> listen 메서드가 붙어있는 것을
        state.forEach((element) {
          logger.d('데이터 확인 : ${element.id}');
        });
      });
    } catch (e) {
      print("Error getting chats.");
      logger.d(e);
    }
  }
}
