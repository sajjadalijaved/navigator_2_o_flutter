import 'package:flutter/material.dart';

class SlidePage extends Page {
  final String name;
  final Widget child;
  SlidePage({
    required this.name,
    required this.child,
  }) : super(key: ValueKey(name), name: name);

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
        settings: this,
        pageBuilder: (context, animation, secondaryAnimation) => child,
        transitionDuration: const Duration(seconds: 1),
        transitionsBuilder: (context, animation, secondAnimation, child) {
          var begin = const Offset(-1, 0);
          var end = Offset.zero;
          var tween = Tween<Offset>(begin: begin, end: end);
          return SlideTransition(
            position: tween.animate(secondAnimation),
            child: child,
          );
        },
        reverseTransitionDuration: const Duration(seconds: 1));
  }
}
