import 'dart:io';

import 'package:flutter/material.dart';

import 'androidMain.dart';
import 'iosMain.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  static const String route = "/";

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
      ? AndroidMain()
      : IosMain();
  }
}
