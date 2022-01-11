import 'package:chat_ui/models/messageModel.dart';
import 'package:chat_ui/service/messageService.dart';
import 'package:chat_ui/views/chat/components/chatBubble.dart';
import 'package:chat_ui/views/chat/components/isNotUserFirstMsg.dart';
import 'package:flutter/cupertino.dart';

class IosChatDetail extends StatefulWidget {
  IosChatDetail({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  State<IosChatDetail> createState() => _IosChatDetailState();
}

class _IosChatDetailState extends State<IosChatDetail> {
  List<MessageModel> messages({required String name}) => MessageService.findMessages(name: name);

  ScrollController _scrollCt = ScrollController();
  TextEditingController _textCt = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((Duration timestamp) {
      MessageService.init(scrollCt: this._scrollCt, context: context);
    });
    super.initState();
  }

  @override
  void dispose() {
    this._scrollCt.dispose();
    this._textCt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        child: Column(
          children: <Widget>[
            Expanded(
              child: CustomScrollView(
                controller: this._scrollCt,
                slivers: <Widget>[
                  CupertinoSliverNavigationBar(
                    largeTitle: Text(this.widget.name),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int i) {
                        final List<MessageModel>_messages = this.messages(name: widget.name);
                        if (MessageService.isNotUserFirstMsg(messages: _messages, index: i)) {
                          return IsNotUserFirstMsg(
                            index: i,
                            messageData: _messages[i],
                            imageUrl: MessageService.getImageurl(name: widget.name),
                            name: this.widget.name,
                          );
                        }
                        return ChatBubble(
                          messageData: _messages[i],
                          isFirstMsg: MessageService.isFirstMsg(messages: _messages, index: i),);
                      },
                      childCount: this.messages(name: this.widget.name).length,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: CupertinoColors.systemTeal,
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
                      autofocus: true,
                      showCursor: true,
                      controller: this._textCt,
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
                        this._textCt.clear();
                        Future.delayed(Duration(milliseconds: 10), () => this._scrollCt.jumpTo(this._scrollCt.position.maxScrollExtent));
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        print("emoji");
                        print(this._scrollCt.position.maxScrollExtent);
                      },
                      child: Icon(CupertinoIcons.smiley),
                    ),
                  ),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}
