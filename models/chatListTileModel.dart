class ChatTileModel {
  final String name;
  final String profileImage;
  final String lastMessage;
  final DateTime lastMsgTime;
  final bool online;
  final bool didUserRead;

  ChatTileModel({
    required this.didUserRead,
    required this.lastMessage,
    required this.lastMsgTime,
    required this.name,
    required this.online,
    required this.profileImage,
  });
}
