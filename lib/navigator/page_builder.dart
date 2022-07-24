import 'package:flutter/material.dart';
import 'package:navigator_2_o_project/screens/errorPage.dart';
import 'package:navigator_2_o_project/screens/homescreen.dart';
import 'package:navigator_2_o_project/screens/thirdpage.dart';

import '../screens/secondpage.dart';

class CusstomPageBuilderDelegate {
  static Page buildPage(RouteSettings settings) {
    String? name = settings.name;
    var argument = settings.arguments;
    switch (name) {
      case MyHomepage.pageName:
        {
          return MaterialPage(
              child: const MyHomepage(),
              key: ValueKey(name),
              name: name,
              arguments: argument);
        }
      case MySecondPage.pageName:
        {
          return MaterialPage(
              child: const MySecondPage(),
              key: ValueKey(name),
              name: name,
              arguments: argument);
        }
      case MyThirdPage.pageName:
        {
          return MaterialPage(
              child: const MyThirdPage(),
              key: ValueKey(name),
              name: name,
              arguments: argument);
        }
      default:
        {
          return MaterialPage(
              child: const ErrorPage(),
              key: ValueKey(name),
              name: name,
              arguments: argument);
        }
    }
  }

  static bool isValidPath(RouteSettings settings) {
    return settings.name == MyHomepage.pageName ||
        settings.name == MySecondPage.pageName ||
        settings.name == MyThirdPage.pageName;
  }
}
