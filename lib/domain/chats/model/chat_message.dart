import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timeago/timeago.dart';

enum MessageType {
  TEXT,
  IMAGE,
  UNKNOWN,
}

class KrCustomMessages implements LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => '방금 전';
  @override
  String aboutAMinute(int minutes) => '${minutes}분 전';
  @override
  String minutes(int minutes) => '${minutes}분 전';
  @override
  String aboutAnHour(int minutes) => '${minutes}분 전';
  @override
  String hours(int hours) => '${hours}시간 전';
  @override
  String aDay(int hours) => '${hours}시간 전';
  @override
  String days(int days) => '${days}일 전';
  @override
  String aboutAMonth(int days) => '${days}일 전';
  @override
  String months(int months) => '${months}개월 전';
  @override
  String aboutAYear(int year) => '${year}년 전';
  @override
  String years(int years) => '${years}년 전';
  @override
  String wordSeparator() => ' ';
}

class ChatMessage {
  final String senderID;
  final MessageType type;
  final String content;
  final Timestamp sentTime;

  ChatMessage({
    required this.content,
    required this.type,
    required this.senderID,
    required this.sentTime,
  });

  factory ChatMessage.fromJSON(Map<String, dynamic> _json) {
    MessageType _messageType;
    switch (_json['type']) {
      case 'text':
        _messageType = MessageType.TEXT;
        break;
      case 'image':
        _messageType = MessageType.IMAGE;
        break;
      default:
        _messageType = MessageType.UNKNOWN;
    }
    return ChatMessage(
        content: _json['content'],
        type: _messageType,
        senderID: _json['sender_id'],
        sentTime: _json['sent_time']);
  }

  Map<String, dynamic> tojson() {
    String _messageType;
    switch (type) {
      case MessageType.TEXT:
        _messageType = 'text';
        break;
      case MessageType.IMAGE:
        _messageType = 'image';
        break;
      default:
        _messageType = '';
    }
    return {
      'content': content,
      'type': _messageType,
      'sender_id': senderID,
      'sent_time': Timestamp.fromDate(sentTime.toDate()),
    };
  }
}
