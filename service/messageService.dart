import 'package:chat_ui/data/chatListData.dart';
import 'package:chat_ui/data/messagesData.dart';
import 'package:chat_ui/models/chatListTileModel.dart';
import 'package:chat_ui/models/messageModel.dart';
import 'package:flutter/widgets.dart';

class MessageService with ChangeNotifier {

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

  static void sendMessage({required String message, required String name}){
    final int _index = MessagesData.messagesData.indexWhere((UserMessages userMsg) => userMsg.name == name);
    MessagesData.messagesData[_index].messages.add(
        MessageModel(message: message, messageSentTime: DateTime.now(), isUser: true));
  }

  static void init({required ScrollController scrollCt, BuildContext? context}){
    ScrollMetrics _metrics;
    if(scrollCt.hasClients){
      scrollCt.jumpTo(scrollCt.position.maxScrollExtent);
      _metrics = scrollCt.position.copyWith();
    }
  }

  static String? dateTimeToText({required DateTime dateTime}) {
    int _minute = dateTime.minute;
    String _min = _minute.toString().padLeft(2, "0");
    int _hour = dateTime.hour;
    if (_hour > 12) {
      switch (_hour) {
        case 13: return "1:$_min PM";
        case 14: return "2:$_min PM";
        case 15: return "3:$_min PM";
        case 16: return "4:$_min PM";
        case 17: return "5:$_min PM";
        case 18: return "6:$_min PM";
        case 19: return "7:$_min PM";
        case 20: return "8:$_min PM";
        case 21: return "9:$_min PM";
        case 22: return "10:$_min PM";
        case 23:return "11:$_min PM";
      }
    } else {
      return "$_hour:$_min AM";
    }
  }
}