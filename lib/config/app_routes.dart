import 'package:app_liffe_task_flutter/modules/activities/page/activities_list_page.dart';
import 'package:app_liffe_task_flutter/modules/splash/splash.dart';
import 'package:flutter/material.dart';

class RoutesApp {
  //General
  static const String splash = '/';
  static const String proyectoDetails = '/proyecto_detail';
  static const String activitiesList = '/activitiesList';

  static Route routesGeneral(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());

      case activitiesList:
        return transitionOpacity(const ActivitiesListPage(), settings);
    }

    throw Exception('This route does not exists');
  }

  static PageRouteBuilder transitionOpacity(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
    );
  }

  static Route<dynamic> noAnimationRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(),
      reverseTransitionDuration: const Duration(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }

  static Route<dynamic> navigateToPageSlider(
    Widget page,
    RouteSettings settings,
  ) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1, 0);
        const end = Offset.zero;
        const curve = Curves.ease;

        final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
