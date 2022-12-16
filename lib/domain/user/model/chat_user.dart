class ChatUser {
  final String uid;
  final String nickName;

  ChatUser({
    required this.uid,
    required this.nickName,
  });

  factory ChatUser.fromJson(Map<String, dynamic> _json) {
    return ChatUser(
      uid: _json['uid'],
      nickName: _json['name'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'nickName': nickName,
    };
  }

  // String lastDayActive() {
  //   return '${lastActive.month}/${lastActive.day}/${lastActive.year}';
  // }
  //
  // bool wasRecentlyActive() {
  //   return DateTime.now().difference(lastActive).inHours < 2;
  // }
}
