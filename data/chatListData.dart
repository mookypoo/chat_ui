import 'package:chat_ui/models/chatListTileModel.dart';

class ChatListData {

  static List<ChatTileModel> chatListData = [
    ChatTileModel(
      didUserRead: false,
      lastMessage: "Happy New Years to you too",
      lastMsgTime: DateTime.now().subtract(Duration(minutes: 5)),
      name: "Yorkshire Terrier Pup",
      online: true,
      profileImage: "https://images.unsplash.com/photo-1546527868-ccb7ee7dfa6a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80",
    ),
    ChatTileModel(
      didUserRead: false,
      lastMessage: "I'm so sorry I don't know what type of dog you are. But you still the goodest boi.",
      lastMsgTime: DateTime.now().subtract(Duration(minutes: 15)),
      name: "Unknown Type of Dog",
      online: false,
      profileImage: "https://images.unsplash.com/photo-1593134257782-e89567b7718a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1335&q=80",
    ),
    ChatTileModel(
      didUserRead: true,
      lastMessage: "My dream dog used to be a golden retriever at one point. They're such friendly and reliable dogs.",
      lastMsgTime: DateTime.now().subtract(Duration(hours: 1)),
      name: "Golden Retriever Pup",
      online: true,
      profileImage: "https://images.unsplash.com/photo-1600804340584-c7db2eacf0bf?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHVwcHl8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=60",
    ),
    ChatTileModel(
      didUserRead: true,
      lastMessage: "Your remind me of my frenchie babies, Queens and Luna.",
      lastMsgTime: DateTime.now().subtract(Duration(hours: 2)),
      name: "French Bulldog",
      online: false,
      profileImage: "https://images.unsplash.com/photo-1583337130417-3346a1be7dee?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cHVwcHl8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=60",
    ),
    ChatTileModel(
      didUserRead: false,
      lastMessage: "Corgi butts are awesome.",
      lastMsgTime: DateTime.now().subtract(Duration(hours: 3)),
      name: "Corgi",
      online: false,
      profileImage: "https://images.unsplash.com/photo-1600077106724-946750eeaf3c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cHVwcHl8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=60",
    ),
    ChatTileModel(
      didUserRead: true,
      lastMessage: "Whoa I have never seen an odd eyed pupper in real life. Beautiful, it is.",
      lastMsgTime: DateTime.now().subtract(Duration(days: 1)),
      name:  "Odd Eyed Pupper",
      online: false,
      profileImage: "https://images.unsplash.com/photo-1601979031925-424e53b6caaa?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHB1cHB5fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=60",
    ),
    ChatTileModel(
      didUserRead: false,
      lastMessage: "Soooo Cutee",
      lastMsgTime: DateTime.now().subtract(Duration(days: 2)),
      name:  "Pomeranian",
      online: true,
      profileImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGel7E8lDGmsNM54qNq5Opgo4NwAnzXi1X8g&usqp=CAU",
    ),
    ChatTileModel(
      didUserRead: false,
      lastMessage: "The all mighty Chow Chow",
      lastMsgTime: DateTime.now().subtract(Duration(days: 2)),
      name:  "Chow Chow",
      online: true,
      profileImage: "https://animals.net/wp-content/uploads/2018/06/Chow-2.jpg",
    ),
  ];

}
