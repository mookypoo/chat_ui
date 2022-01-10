import 'package:chat_ui/models/messageModel.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

import 'chatBubblePointer.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({Key? key, required this.messageData, required this.isFirstMsg}) : super(key: key);
  final MessageModel messageData;
  final bool isFirstMsg;

  EdgeInsets _margin(){
    if (!messageData.isUser) {
      return EdgeInsets.only(top: 5.0, bottom: 5.0, left: 65.0);
    } else {
      if (this.isFirstMsg) {
        return EdgeInsets.only(top: 15.0, left: 10.0, right: 20.0, bottom: 5.0);
      } else {
        return EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print(messageData.isUser),
      child: Container(
        margin: this._margin(),
        child: Row(
          mainAxisAlignment: messageData.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(12.0),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22.0),
                    color: messageData.isUser ? Color.fromRGBO(75,104,184, 1.0) : Color.fromRGBO(187, 222, 234, 1.0),
                  ),
                  child: Text(
                    this.messageData.message,
                    softWrap: true,
                    maxLines: 8,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: messageData.isUser ? Color.fromRGBO(255, 255, 255, 1.0) : Color.fromRGBO(0, 0, 0, 1.0),
                    ),
                  ),
                ),
                messageData.isUser && this.isFirstMsg ? Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: Transform(
                    transform: Matrix4.rotationY(math.pi),
                    child: CustomPaint(
                      painter: ChatBubblePointer(fillColor: Color.fromRGBO(75,104,184, 1.0),),
                    ),
                  ),
                ) : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

