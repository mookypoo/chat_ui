import 'package:chat_ui/models/tabModel.dart';
import 'package:chat_ui/views/chat/chatList/chatListPage.dart';
import 'package:chat_ui/views/profile/profilePage.dart';
import 'package:chat_ui/views/settings/settingsPage.dart';
import 'package:flutter/cupertino.dart';

class IosMain extends StatefulWidget {
  IosMain({Key? key}) : super(key: key);

  @override
  State<IosMain> createState() => _IosMainState();
}

class _IosMainState extends State<IosMain> {
  final List<TabModel> _tabs = [
    TabModel(
      page: ChatListPage(),
      icon: Icon(CupertinoIcons.chat_bubble, size: 30.0,),
    ),
    TabModel(
      page: SettingsPage(),
      icon: Icon(CupertinoIcons.person, size: 30.0,),
    ),
    TabModel(
      page: ProfilePage(),
      icon: Icon(CupertinoIcons.settings, size: 30.0,),
    ),
  ];

  int _currentIndex = 0;
  PageController _pageCt = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView(
                controller: this._pageCt,
                onPageChanged: (int i) {
                  this.setState(() {
                    this._currentIndex = i;
                  });
                },
                children: this._tabs.map<Widget>((TabModel m) => m.page).toList(),
              ),
            ),
            GestureDetector(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.09,
                width: double.infinity,
                child: Row(
                  children: this._tabs.map<Widget>((TabModel tb) {
                    int _index = this._tabs.indexOf(tb);
                    return GestureDetector(
                      onTap: () {
                        this.setState(() {
                          this._currentIndex = _index;
                        });
                        this._pageCt.jumpToPage(_index);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            tb.icon,
                            Container(
                              margin: EdgeInsets.only(top: 13.0),
                              height: 6.0,
                              decoration: this._currentIndex == _index
                                ? BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 0, 122, 255),
                                  )
                                : null,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
