import 'dart:io';

import 'package:flutter/widgets.dart';

import 'androidChatDetail.dart';
import 'iosChatDetail.dart';

class ChatDetailPage extends StatelessWidget {
  const ChatDetailPage({Key? key}) : super(key: key);
  static const String route = "/chatDetailPage";

  @override
  Widget build(BuildContext context) {
    final _name = ModalRoute.of(context)!.settings.arguments as String;

    return Platform.isAndroid
      ? AndroidChatDetail()
      : IosChatDetail(name: _name,);
  }
}
