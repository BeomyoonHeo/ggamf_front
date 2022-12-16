import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggamf_front/domain/chats/model/chat_message.dart';

const String USER_COLLECTION = "Users";
const String CHAT_COLLECTION = "Chats";
const String MESSAGES_COLLECTION = "messages";

final databaseService = Provider((ref) => DatabaseService());

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  DatabaseService() {}

  Future<void> createUser(String _uid, String _nickName) async {
    try {
      await _db.collection(USER_COLLECTION).doc(_uid).set({
        'uid': _uid,
        'nickName': _nickName,
      });
    } catch (e) {
      print(e);
    }
  }

  //firestore의 collection아이디를 가지고 온다.
  Future<DocumentSnapshot> getUser(String _uid) {
    return _db.collection(USER_COLLECTION).doc(_uid).get();
  }

  Future<void> createChatRoom(
      {required int roomId,
      required String ownerId,
      required int totalPeople}) async {
    Map<String, dynamic> messages = {
      'content': 'dummy',
      'sender_id': '${ownerId}',
      'sent_time': '${DateTime.now().toString()}',
      'type': 'text',
    };
    List<String> members = [ownerId];
    Map<String, dynamic> roomInfo = {
      'id': roomId,
      'members': members,
      'total_people': totalPeople
    };
    await _db.collection(CHAT_COLLECTION).doc(roomId.toString()).set(roomInfo);
    await _db
        .collection(CHAT_COLLECTION)
        .doc(roomId.toString())
        .collection(MESSAGES_COLLECTION)
        .add(messages);
  }

  //Chats 컬렉션에 있는 members중에 같은 uid를 가지고 있는 데이터를 가지고 온다.
  Stream<QuerySnapshot> getChatsForUser(String _uid) {
    return _db
        .collection(CHAT_COLLECTION)
        .where('members', arrayContains: _uid)
        .snapshots();
  }

  Future<QuerySnapshot> getLastMessageForChat(String _chatID) {
    return _db
        .collection(CHAT_COLLECTION) // chat Collection
        .doc(_chatID) // chatID가 같은 도큐먼트 셀렉트
        .collection(MESSAGES_COLLECTION) // Message Collection
        .orderBy('sent_time', descending: true) // sent_time 이 늦은 순 정렬 -> 최신
        .limit(1) // 하나만 select 하겠다.
        .get();
  }

  Stream<QuerySnapshot> streamMessagesForChat(String _chatID) {
    return _db
        .collection(CHAT_COLLECTION)
        .doc(_chatID)
        .collection(MESSAGES_COLLECTION)
        .orderBy('sent_time', descending: false)
        .snapshots();
  }

  Future<void> addMessageToChat(String _chatID, ChatMessage _message) async {
    try {
      await _db
          .collection(CHAT_COLLECTION)
          .doc(_chatID)
          .collection(MESSAGES_COLLECTION)
          .add(
            _message.tojson(),
          );
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateChatData(
      String _chatID, Map<String, dynamic> _data) async {
    try {
      await _db.collection(CHAT_COLLECTION).doc(_chatID).update(_data);
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateUserLastSeenTime(String _uid) async {
    try {
      await _db.collection(USER_COLLECTION).doc(_uid).update({
        'last_active': DateTime.now(),
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteChat(String _chatID) async {
    try {
      await _db.collection(CHAT_COLLECTION).doc(_chatID).delete();
    } catch (e) {
      print(e);
    }
  }
}
