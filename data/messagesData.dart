import 'package:chat_ui/models/messageModel.dart';

class MessagesData {

  static List<UserMessages> messagesData = [
    UserMessages(
      name: "Yorkshire Terrier Pup",
      messages: [
        MessageModel(
          message: "Yooooo",
          messageSentTime: DateTime.now().subtract(Duration(days: 1)),
          isUser: true,
        ),
        MessageModel(
          message: "Hi dawg, how you doing?",
          messageSentTime: DateTime.now().subtract(Duration(hours: 2)),
          isUser: false,
        ),
        MessageModel(
          message: "I'm good. Just wanted to say Happy New Years~ How are you these days? Everything good??",
          messageSentTime: DateTime.now().subtract(Duration(hours: 1)),
          isUser: true,
        ),
        MessageModel(
          message: "Btw, my pupper says hi",
          messageSentTime: DateTime.now().subtract(Duration(minutes: 38)),
          isUser: true,
        ),
        MessageModel(
          message: "Yah man, I'm doing good! Thanks for asking.",
          messageSentTime: DateTime.now().subtract(Duration(minutes: 8)),
          isUser: false,
        ),
        MessageModel(
          message: "Happy New Years to you too.",
          messageSentTime: DateTime.now().subtract(Duration(minutes: 5)),
          isUser: false,
        ),
      ],
    ),
    UserMessages(
      name: "Unknown Type of Dog",
      messages: [
        MessageModel(
          message: "I'm so sorry I don't know what type of dog you are. But you still the goodest boi.",
          messageSentTime: DateTime.now().subtract(Duration(minutes: 15)),
          isUser: false,
        ),
      ],
    ),
    UserMessages(
      name: "Golden Retriever Pup",
      messages: [
        MessageModel(
          message: "My dream dog used to be a golden retriever at one point. They're such friendly and reliable dogs.",
          messageSentTime: DateTime.now().subtract(Duration(hours: 1)),
          isUser: true,
        ),
      ],
    ),
    UserMessages(
      name: "French Bulldog",
      messages: [
        MessageModel(
          message: "Your remind me of my frenchie babies, Queens and Luna.",
          messageSentTime: DateTime.now().subtract(Duration(hours: 2)),
          isUser: true,
        ),
      ],
    ),
    UserMessages(
      name: "Corgi",
      messages: [
        MessageModel(
          message: "Corgi butts are awesome.",
          messageSentTime: DateTime.now().subtract(Duration(hours: 3)),
          isUser: false,
        ),
      ],
    ),
    UserMessages(
      name: "Odd Eyed Pupper",
      messages: [
        MessageModel(
          message: "Whoa I have never seen an odd eyed pupper in real life. Beautiful, it is.",
          messageSentTime: DateTime.now().subtract(Duration(days: 1)),
          isUser: false,
        ),
      ],
    ),
  ];

}