import 'dart:io';

import 'package:flutter/material.dart';

import 'androidChatList.dart';
import 'iosChatList.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
      ? AndroidChatList()
      : IosChatList();
  }
}
