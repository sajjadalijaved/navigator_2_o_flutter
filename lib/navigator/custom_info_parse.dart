import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:navigator_2_o_project/navigator/page_builder.dart';
import 'package:navigator_2_o_project/screens/errorPage.dart';

class CustomRouteInforParser extends RouteInformationParser<RouteSettings> {
  @override
  Future<RouteSettings> parseRouteInformation(
      RouteInformation routeInformation) {
    final settings = RouteSettings(name: routeInformation.location);
    if (CusstomPageBuilderDelegate.isValidPath(settings)) {
      return SynchronousFuture(settings);
    }
    return SynchronousFuture(const RouteSettings(name: ErrorPage.pageName));
  }

  @override
  RouteInformation? restoreRouteInformation(RouteSettings configuration) {
    if (CusstomPageBuilderDelegate.isValidPath(configuration)) {
      return RouteInformation(location: configuration.name);
    }
    return const RouteInformation(
      location: ErrorPage.pageName,
    );
  }
}
