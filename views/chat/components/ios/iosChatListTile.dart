import 'package:chat_ui/models/chatListTileModel.dart';
import 'package:chat_ui/service/messageService.dart';
import 'package:chat_ui/views/chat/chatDetail/chatDetailPage.dart';
import 'package:flutter/cupertino.dart';

class IosChatListTile extends StatelessWidget {
  const IosChatListTile({Key? key, required this.messageData, required this.dismissKey}) : super(key: key);
  final ChatTileModel messageData;
  final int dismissKey;

  Widget _deleteAlertDialog({required BuildContext ctx}) {
    return CupertinoAlertDialog(
      title: Text("Delete?"),
      actions: [
        CupertinoButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text('Yes')),
        CupertinoButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text('No'))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.of(context).pushNamed(
          ChatDetailPage.route,
          arguments: messageData.name,
        );
      },
      child: Dismissible(
        confirmDismiss: (DismissDirection direction) async {
          return await showCupertinoDialog<bool>(
            context: context,
            builder: (BuildContext context) => this._deleteAlertDialog(ctx: context),
          );
        },
        direction: DismissDirection.endToStart,
        onDismissed: (DismissDirection direction) {},
        key: ValueKey(key),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          width: double.infinity,
          height: (MediaQuery.of(context).size.height * 0.60) / 5,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 15.0, right: 10.0),
                        width: MediaQuery.of(context).size.width * 0.20,
                        height: MediaQuery.of(context).size.width * 0.20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(messageData.profileImage,),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 7.0,
                        right: 10.0,
                        child: Stack(
                          children: messageData.online ? <Widget>[
                            Container(
                              width: 20.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255,255,255, 1.0),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Positioned(
                              left: 0.0,
                              right: 0.0,
                              top: 5.0,
                              child: Container(
                                padding: EdgeInsets.all(7.0),
                                foregroundDecoration: BoxDecoration(
                                ),
                                width: 10.0,
                                height: 10.0,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(0,255,0, 1.0),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ] : [Container()],
                        ),
                      ),
                    ]
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: Text(messageData.name, style: TextStyle(fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Text(
                                MessageService.covertTimeToString(time: messageData.lastMsgTime),
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Text(
                              messageData.lastMessage,
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 14.0)
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}
