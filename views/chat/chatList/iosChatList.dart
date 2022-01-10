import 'package:chat_ui/data/chatListData.dart';
import 'package:chat_ui/views/chat/components/ios/iosChatListTile.dart';
import 'package:flutter/cupertino.dart';

class IosChatList extends StatelessWidget {
  IosChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text("Messages"),
            trailing: CupertinoButton(
              child: Icon(CupertinoIcons.search, size: 30.0),
              onPressed: () {},
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int i) => IosChatListTile(
                dismissKey: i,
                messageData: ChatListData.chatListData[i]
              ),
              childCount: ChatListData.chatListData.length,
            ),
          ),
        ],
      ),
    );
  }
}
