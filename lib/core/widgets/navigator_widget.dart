import 'package:flutter/material.dart';

class NavigatorWidget extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  final RouteFactory route;
  final Widget view;

  NavigatorWidget(this.view, this.route);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: this.navigatorKey,
      onGenerateRoute: this.route,
    );
  }
}
