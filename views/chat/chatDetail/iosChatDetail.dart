import 'package:chat_ui/models/messageModel.dart';
import 'package:chat_ui/service/messageService.dart';
import 'package:chat_ui/service/scrollService.dart';
import 'package:chat_ui/views/chat/components/chatBubble.dart';
import 'package:flutter/cupertino.dart';

class IosChatDetail extends StatefulWidget {
  IosChatDetail({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  State<IosChatDetail> createState() => _IosChatDetailState();
}

class _IosChatDetailState extends State<IosChatDetail> {
  List<MessageModel> messages() => MessageService.findMessages(name: this.widget.name);

  ScrollController _scrollCt = ScrollController();
  TextEditingController? _newMsgCt = TextEditingController();
  TextEditingController? _searchTextCt = TextEditingController();

  bool isSearch = false;

  String? _searchText;

  // todo when there's no search results, inform user
  // todo be able to go up and down on search results

  Widget _searchTextfield(){
    return Container(
      child: CupertinoTextField(
        controller: this._searchTextCt!,
        autofocus: true,
        autocorrect: false,
        showCursor: true,
        onSubmitted: (String text) {
          this.setState(() {
            this._searchText = text;
          });
        },
      ),
    );
  }

  Widget _floatingActionButton(){
    return GestureDetector(
      onTap: () => this._scrollCt.jumpTo(this._scrollCt.position.maxScrollExtent),
      child: Container(
        width: 40.0,
        height: 40.0,
        child: Icon(CupertinoIcons.down_arrow, color: Color.fromRGBO(0, 255, 255, 1.0),),
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.8),
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _messageTextfield(){
    return Container(
      color: Color.fromRGBO(0, 255, 255, 1.0),
      height: MediaQuery.of(context).size.height * 0.07,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () => print("add media"),
              child: Icon(CupertinoIcons.add),
            ),
          ),
          Expanded(
            child: CupertinoTextField(
              showCursor: true,
              controller: this._newMsgCt,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19.0),
              ),
              onSubmitted: (String message) async {
                this.setState(() {
                  MessageService.sendMessage(
                    message: message,
                    name: this.widget.name,
                  );
                });
                this._newMsgCt!.clear();
                Future.delayed(Duration(milliseconds: 10), () => this._scrollCt.jumpTo(this._scrollCt.position.maxScrollExtent));
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                print("emoji");
                print(ScrollService.isAtBottom);
              },
              child: Icon(CupertinoIcons.smiley),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((Duration timestamp) {
      ScrollService.init(scrollCt: this._scrollCt, context: context, cb: () => this.setState(() {}));
    });
    super.initState();
  }

  @override
  void dispose() {
    this._scrollCt.dispose();
    this._newMsgCt!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: CustomScrollView(
                    controller: this._scrollCt,
                    slivers: <Widget>[
                      CupertinoSliverNavigationBar(
                        transitionBetweenRoutes: false,
                        largeTitle: !this.isSearch ? Text(this.widget.name) : this._searchTextfield(),
                        trailing: CupertinoButton(
                          padding: EdgeInsets.all(0.0),
                          child: !this.isSearch ? Icon(CupertinoIcons.search, size: 30.0) : Icon(CupertinoIcons.xmark_circle, size: 30.0),
                          onPressed: () {
                            this.setState(() {
                              this.isSearch = !this.isSearch;
                              if (!this.isSearch) {
                                this._searchTextCt!.clear();
                                this._searchText = "";
                              }
                            });
                          },
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int i) {
                            final List<MessageModel>_messages = this.messages();
                            return ChatBubble(
                              searchText: this._searchText,
                              name: this.widget.name,
                              imageUrl: MessageService.getImageurl(name: widget.name),
                              messageData: _messages[i],
                              isFirstMsg: MessageService.isFirstMsg(messages: _messages, index: i),);
                          },
                          childCount: this.messages().length,
                        ),
                      ),
                    ],
                  ),
                ),
                this._messageTextfield(),
              ],
            ),
            !ScrollService.isAtBottom ? Positioned(
              bottom: 70.0,
              right: 5.0,
              child: this._floatingActionButton(),
            ) : Container(),
          ],
        ),
      ),
    );
  }
}
