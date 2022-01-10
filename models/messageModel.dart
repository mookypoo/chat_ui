class MessageModel {
  final DateTime messageSentTime;
  final String message;
  final bool isUser;

  MessageModel({required this.message, required this.messageSentTime, required this.isUser});
}

class UserMessages {
  final String name;
  List<MessageModel> messages;

  UserMessages({required this.name, required this.messages});
}