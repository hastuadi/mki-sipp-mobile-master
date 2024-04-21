import 'package:flutter/cupertino.dart';

class AppNavigation {
  AppNavigation._private();

  static AppNavigation instance = AppNavigation._private();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  factory AppNavigation() {
    return instance;
  }

  BuildContext? getContext() {
    return AppNavigation.instance.navigatorKey.currentContext;
  }

  Future push<T extends Object?>({required Widget page}) async {
    AppNavigation.instance.navigatorKey.currentState!.push(
      CupertinoPageRoute(builder: (context) => page,)
    );
  }

  Future pushAndRemoveUntil<T extends Object?>({required Widget page}) async {
    AppNavigation.instance.navigatorKey.currentState!.pushAndRemoveUntil(
        CupertinoPageRoute(builder: (context) => page,), (route) => false,
    );
  }

  pop<T extends Object?>([T? result]) {
    AppNavigation.instance.navigatorKey.currentState!.pop(result);
  }

  pushReplacement({required Widget page}) {
    AppNavigation.instance.navigatorKey.currentState!.pushReplacement(
      CupertinoPageRoute(builder: (context) => page,)
    );
  }

}