import 'package:flutter/material.dart';

extension NavigationHelper on BuildContext {
  Future<T?> myPush<T>(Widget widget) async {
    final result = await Navigator.of(this)
        .push<T>(MaterialPageRoute(builder: (context) => widget));
    return result;
  }

  Future<T?> myShowDialog<T>(Widget widget) async {
    final result = showDialog<T>(context: this, builder: (context) => widget);
    return result;
  }

  Future<T?> myPushReplacment<T>(Widget widget) async {
    final result = await Navigator.of(this).pushReplacement<T, dynamic>(
        MaterialPageRoute(builder: (context) => widget));
    return result;
  }

  Future<T?> myPushAndRemoveUntil<T>(Widget widget) async {
    final result = await Navigator.of(this).pushAndRemoveUntil<T>(
        MaterialPageRoute(builder: (context) => widget), (route) => false);
    return result;
  }

  void myPop({dynamic result}) async {
    Navigator.of(this).pop(result);
  }
}
