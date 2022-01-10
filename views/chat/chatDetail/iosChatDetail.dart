import 'package:chat_ui/models/messageModel.dart';
import 'package:chat_ui/service/messageService.dart';
import 'package:chat_ui/views/chat/components/chatBubble.dart';
import 'package:chat_ui/views/chat/components/isNotUserFirstMsg.dart';
import 'package:flutter/cupertino.dart';

class IosChatDetail extends StatelessWidget {
  const IosChatDetail({Key? key, required this.name}) : super(key: key);
  final String name;

  List<MessageModel> messages({required String name}) => MessageService.findMessages(name: name);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        child: CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text(this.name),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int i) {
                  final List<MessageModel>_messages = this.messages(name: name);
                  if (MessageService.isNotUserFirstMsg(messages: _messages, index: i)) {
                    return IsNotUserFirstMsg(
                      index: i,
                      messageData: _messages[i],
                      imageUrl: MessageService.getImageurl(name: name),
                      name: this.name,
                    );
                  }
                  return ChatBubble(
                    messageData: _messages[i],
                    isFirstMsg: MessageService.isFirstMsg(messages: _messages, index: i),);
                },
                childCount: this.messages(name: this.name).length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
