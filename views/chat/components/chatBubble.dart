import 'package:chat_ui/models/messageModel.dart';
import 'package:chat_ui/service/messageService.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

import 'chatBubblePointer.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    required this.messageData,
    required this.isFirstMsg,
    required this.imageUrl,
    required this.name,
    required this.searchText,
  }) : super(key: key);
  final MessageModel messageData;
  final bool isFirstMsg;
  final String imageUrl;
  final String name;
  final String? searchText;

  EdgeInsets _margin(){
    if (!messageData.isUser) {
      if (this.isFirstMsg) {
        return EdgeInsets.only(top: 15.0, bottom: 5.0, left: 10.0,);
      } else {
        return EdgeInsets.only(top: 5.0, bottom: 5.0, left: 65.0);
      }
    } else {
      if (this.isFirstMsg) {
        return EdgeInsets.only(top: 15.0, left: 10.0, right: 20.0, bottom: 5.0);
      } else {
        return EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0);
      }
    }
  }

  Widget _imageWidget() {
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      height: 45.0,
      width: 45.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: NetworkImage(this.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this._margin(),
      child: Row(
        crossAxisAlignment: !messageData.isUser && isFirstMsg ? CrossAxisAlignment.start : CrossAxisAlignment.end, /* 요기 다름 */
        mainAxisAlignment: messageData.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          // isNotUser's profile image
          !messageData.isUser && isFirstMsg ? this._imageWidget() : Container(),
          messageData.isUser ? Container(
            margin: EdgeInsets.symmetric(horizontal: 3.0),
            child: Text(
              MessageService.dateTimeToText(dateTime: messageData.messageSentTime) ?? "",
              style: TextStyle(fontSize: 13.0),
            ),
          ) : Container(),
          Column(
            crossAxisAlignment: messageData.isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              // isNotUser's name
              !messageData.isUser && isFirstMsg ? Container(
                margin: EdgeInsets.only(bottom: 5.0),
                child: Text(this.name),
              ) : Container(),
              Stack(
                children: <Widget>[
                  !messageData.isUser && isFirstMsg ? Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    child: CustomPaint(
                      painter: ChatBubblePointer(fillColor: Color.fromRGBO(187, 222, 234, 1.0),),
                    ),
                  ) : Container(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(12.0),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.6,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22.0),
                          color: messageData.isUser ? Color.fromRGBO(144,238,144, 1.0) : Color.fromRGBO(187, 222, 234, 1.0),
                        ),
                        child: RichText(
                          maxLines: 8,
                          text: TextSpan(
                            children: MessageService.highlightMessage(
                              message: this.messageData.message,
                              searchText: this.searchText,
                            ),
                          ),
                        ),

                        /*
                        Text(
                          this.messageData.message,
                          softWrap: true,
                          maxLines: 8,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromRGBO(0, 0, 0, 1.0),
                            backgroundColor: this.messageData.message[2] == "w" ? Color.fromRGBO(255, 255, 0, 0.9) : null
                          ),
                        ),
                         */
                      ),
                      !messageData.isUser ? Container(
                        margin: EdgeInsets.symmetric(horizontal: 3.0),
                        child: Text(
                          MessageService.dateTimeToText(dateTime: messageData.messageSentTime) ?? "",
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ) : Container(),
                    ],
                  ),
                  messageData.isUser && this.isFirstMsg ? Positioned(
                    bottom: 0.0,
                    right: 0.0,
                    child: Transform(
                      transform: Matrix4.rotationY(math.pi),
                      child: CustomPaint(
                        painter: ChatBubblePointer(fillColor: Color.fromRGBO(144,238,144, 1.0),),
                      ),
                    ),
                  ) : Container(),

                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

