import 'package:flutter/material.dart';

class NavigationHelper {
  static Future<dynamic> pushreplacement(
      {required Widget widget, required BuildContext context}) {
    return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ));
  }

  static Future<dynamic> push(
      {required Widget widget, required BuildContext context}) {
    return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ));
  }

  static void pop(
    BuildContext context,
  ) {
    Navigator.pop(
      context,
    );
  }
}
