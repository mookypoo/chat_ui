import 'dart:io';

import 'package:chat_ui/views/chat/chatDetail/chatDetailPage.dart';
import 'package:chat_ui/views/main/mainPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
      ? MaterialApp(
          theme: ThemeData(
            textTheme: GoogleFonts.montserratTextTheme(),
          ),
          onGenerateRoute: (RouteSettings route) {
            if (route.name == ChatDetailPage.route) {
              final String _name = route.arguments as String;
              return MaterialPageRoute(
                builder: (BuildContext context) => ChatDetailPage(),
                settings: RouteSettings(name: ChatDetailPage.route, arguments: _name),
              );
            }
            return MaterialPageRoute(
              builder: (BuildContext context) => MainPage(),
              settings: RouteSettings(name: MainPage.route),
            );
          },
        )
      : CupertinoApp(
          theme: CupertinoThemeData(
            textTheme: CupertinoTextThemeData(
              textStyle: GoogleFonts.montserrat(
                color: CupertinoColors.black,
                fontSize: 16.0,
              )
            ),
          ),
          onGenerateRoute: (RouteSettings route) {
            if (route.name == ChatDetailPage.route) {
              final String _name = route.arguments as String;
              return MaterialPageRoute(
                builder: (BuildContext context) => ChatDetailPage(),
                settings: RouteSettings(name: ChatDetailPage.route, arguments: _name),
              );
            }
            return MaterialPageRoute(
              builder: (BuildContext context) => MainPage(),
              settings: RouteSettings(name: MainPage.route),
            );
          },
        );
  }
}
