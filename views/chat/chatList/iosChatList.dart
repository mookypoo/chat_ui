import 'package:chat_ui/data/chatListData.dart';
import 'package:chat_ui/service/scrollService.dart';
import 'package:chat_ui/views/chat/components/ios/iosChatListTile.dart';
import 'package:flutter/cupertino.dart';

class IosChatList extends StatefulWidget {
  IosChatList({Key? key}) : super(key: key);

  @override
  State<IosChatList> createState() => _IosChatListState();
}

class _IosChatListState extends State<IosChatList> {
  ScrollController _scrollCt = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      this._scrollCt.addListener(() {
        ScrollService.scrollOffset = this._scrollCt.offset;
      });
      if (ScrollService.scrollOffset != null ) {
        this._scrollCt.jumpTo(ScrollService.scrollOffset!);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    this._scrollCt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        controller: this._scrollCt,
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
