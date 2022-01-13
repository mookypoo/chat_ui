import 'package:flutter/widgets.dart';

class ScrollService {
  static double? scrollOffset;
  static bool isAtBottom = true;

  static void init({required ScrollController scrollCt, BuildContext? context, required Function() cb}){
    if(scrollCt.hasClients){
      scrollCt.jumpTo(scrollCt.position.maxScrollExtent);
      scrollCt.addListener(() {
        if (scrollCt.position.extentAfter > 0.0) {
          ScrollService.isAtBottom = false;
          cb();
        }
        if (scrollCt.position.extentAfter == 0.0) {
          ScrollService.isAtBottom = true;
          cb();
        }
      });
    }
  }
}