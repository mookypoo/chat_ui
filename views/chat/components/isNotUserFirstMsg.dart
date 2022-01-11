import 'package:chat_ui/models/messageModel.dart';
import 'package:chat_ui/service/messageService.dart';
import 'package:chat_ui/views/chat/components/chatBubblePointer.dart';
import 'package:flutter/widgets.dart';

class IsNotUserFirstMsg extends StatelessWidget {
  IsNotUserFirstMsg({Key? key, required this.messageData, required this.imageUrl, required this.name, required this.index}) : super(key: key);
  final MessageModel messageData;
  final String imageUrl;
  final String name;
  final int index;

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
      margin: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 10.0,),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          this._imageWidget(),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 5.0),
                child: Text(this.name),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        child: CustomPaint(
                          painter: ChatBubblePointer(fillColor: Color.fromRGBO(187, 222, 234, 1.0),),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(12.0),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.6,
                        ),
                        decoration: BoxDecoration(
                          // border: Border.all(),
                          borderRadius: BorderRadius.circular(22.0),
                          color: Color.fromRGBO(187, 222, 234, 1.0),
                        ),
                        child: Text(
                          this.messageData.message,
                          maxLines: 8,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromRGBO(0, 0, 0, 1.0),
                          ),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 3.0),
                    child: Text(
                      MessageService.dateTimeToText(dateTime: messageData.messageSentTime) ?? "",
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                ]
              ),
            ],
          ),
        ],
      ),
    );
  }
}


