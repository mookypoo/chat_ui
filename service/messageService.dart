import 'dart:ui';

import 'package:chat_ui/data/chatListData.dart';
import 'package:chat_ui/data/messagesData.dart';
import 'package:chat_ui/models/chatListTileModel.dart';
import 'package:chat_ui/models/messageModel.dart';
import 'package:flutter/widgets.dart';

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

  static void sendMessage({required String message, required String name}){
    final int _index = MessagesData.messagesData.indexWhere((UserMessages userMsg) => userMsg.name == name);
    MessagesData.messagesData[_index].messages.add(
        MessageModel(message: message, messageSentTime: DateTime.now(), isUser: true));
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

  static TextSpan highlightedTextSpan({required String text, required bool needHighlight}){
    return TextSpan(
      text: text,
      style: TextStyle(
        fontSize: 16.0,
        color: Color.fromRGBO(0, 0, 0, 1.0),
        backgroundColor: needHighlight ? Color.fromRGBO(255, 255, 0, 0.9) : null,
      ),
    );
  }

  static List<TextSpan> highlightMessage({required String? searchText, required String message}){
    if (searchText == null || !message.toLowerCase().trim().contains(searchText.toLowerCase().trim()) || searchText.isEmpty) {
      return [MessageService.highlightedTextSpan(
        text: message,
        needHighlight: false,
      )];
    }
    List<TextSpan> _messageText = [];
    Iterable<Match> _matches = searchText.toLowerCase().trim().allMatches(message.toLowerCase().trim()).toList();
    int startIndex = 0;
    for (int i=0; i < _matches.length; i++) {
      final Match _match = _matches.elementAt(i);

      _messageText.add(MessageService.highlightedTextSpan(
          text: message.substring(startIndex, _match.start),
          needHighlight: false,));

      _messageText.add(MessageService.highlightedTextSpan(
        text: message.substring(_match.start, _match.end),
        needHighlight: true,));

      if (i == _matches.length - 1 && _match.end != message.length) {
        _messageText.add(MessageService.highlightedTextSpan(
          text: message.substring(_match.end),
          needHighlight: false,));
      }

      startIndex = _match.end;
    }
    return _messageText;
  }

  static Color? backgroundColor({required String? searchText, required String message}) {
    if (searchText == null) return null;
    if (message.toLowerCase().contains(searchText.toLowerCase())) {
      int _startIndex = message.toLowerCase().indexOf(searchText);
      // for (int i = 0; i < message.length; i++) {
      //   if (message[i])
      // }
      for (int i = _startIndex; i < searchText.length; i++) {
        return Color.fromRGBO(255, 255, 0, 0.9);
      }
    } else {
      return null;
    }
  }
}
