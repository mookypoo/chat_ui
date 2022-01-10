import 'package:chat_ui/data/chatListData.dart';
import 'package:chat_ui/data/messagesData.dart';
import 'package:chat_ui/models/chatListTileModel.dart';
import 'package:chat_ui/models/messageModel.dart';

class MessageService {

  static String covertTimeToString({required DateTime time}) {
    Duration difference = DateTime.now().difference(time);
    if (difference < Duration(hours: 1)) {
      return("${difference.inMinutes} min ago");
    } else if (Duration(hours: 1) <= difference && difference < Duration(days: 1)) {
      return("${difference.inHours} hour ago");
      // todo need to work on the month duration depending on which month it is
    } else if (Duration(days: 1) <= difference && difference < Duration(days: 32)) {
      return("${difference.inDays} day ago");
    }
    return "";
  }

  static List<MessageModel> findMessages({required String name}) {
    final int _index = MessagesData.messagesData.indexWhere((UserMessages userMsg) => userMsg.name == name);
    return MessagesData.messagesData[_index].messages;
  }

  static String getImageurl({required String name}) {
    final int _index = ChatListData.chatListData.indexWhere((ChatTileModel data) => data.name == name);
    return ChatListData.chatListData[_index].profileImage;
  }

  static bool isNotUserFirstMsg({required List<MessageModel> messages, required int index}){
    if (messages[index].isUser) {
      return false;
    } else {
      if (index == 0) {
        return true;
      } else if (messages[index-1].isUser) {
        return true;
      } else {
        return false;
      }
    }
  }

  static bool isFirstMsg({required List<MessageModel> messages, required int index}) {
    if (index == 0) {
      return true;
    } else if (messages[index].isUser != messages[index-1].isUser) {
      return true;
    } else {
      return false;
    }
  }
}