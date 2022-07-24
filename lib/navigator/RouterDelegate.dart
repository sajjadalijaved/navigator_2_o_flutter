import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:navigator_2_o_project/navigator/page_builder.dart';
import 'package:navigator_2_o_project/screens/errorPage.dart';

class MyRouterDelegate extends RouterDelegate<RouteSettings>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  List<RouteSettings> stack = <RouteSettings>[];

  static MyRouterDelegate of(BuildContext context) {
    var dedegate = Router.of(context).routerDelegate;
    assert(dedegate is MyRouterDelegate);
    return dedegate as MyRouterDelegate;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: onPopPage,
      pages: [
        for (RouteSettings r in stack) CusstomPageBuilderDelegate.buildPage(r)
      ],
    );
  }

  @override
  Future<bool> popRoute() {
    if (stack.length > 1) {
      stack.removeLast();
      return SynchronousFuture(true);
    }
    return SynchronousFuture(false);
  }

  bool onPopPage(Route<dynamic> route, dynamic result) {
    if (stack.isNotEmpty) {
      if (route.isCurrent) {
        stack.remove(stack.last);
        notifyListeners();
      }
    }
    return route.didPop(result);
  }

  void pop() {
    if (stack.isNotEmpty) {
      stack.remove(stack.last);
      notifyListeners();
    }
  }

  void push(RouteSettings settings) {
    stack.add(settings);
    notifyListeners();
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  @override
  RouteSettings? get currentConfiguration => stack.isNotEmpty
      ? stack.last
      : const RouteSettings(name: ErrorPage.pageName);

  @override
  Future<void> setInitialRoutePath(RouteSettings configuration) {
    return super.setInitialRoutePath(configuration);
  }

  @override
  Future<void> setNewRoutePath(RouteSettings configuration) {
    stack
      ..clear()
      ..add(configuration);
    return SynchronousFuture<void>(null);
  }
}
