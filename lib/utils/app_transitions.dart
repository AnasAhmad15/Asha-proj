import 'package:flutter/material.dart';

class AppTransitions {
  static PageRouteBuilder<T> createRoute<T>(
    Widget page, {
    String? routeName,
    Object? arguments,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return PageRouteBuilder<T>(
      settings: RouteSettings(name: routeName, arguments: arguments),
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.easeInOut;

        var tween = Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
            .chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: FadeTransition(
            opacity: animation.drive(CurveTween(curve: curve)),
            child: child,
          ),
        );
      },
    );
  }

  static PageRouteBuilder<T> createBottomSheetRoute<T>(
    Widget page, {
    String? routeName,
    Object? arguments,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return PageRouteBuilder<T>(
      settings: RouteSettings(name: routeName, arguments: arguments),
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.easeInOut;

        var tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero)
            .chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: FadeTransition(
            opacity: animation.drive(CurveTween(curve: curve)),
            child: child,
          ),
        );
      },
    );
  }
}
