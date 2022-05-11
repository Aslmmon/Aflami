import 'package:afalmi/presentation/splash/Splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() => MaterialPageRoute(
      builder: (_) => const Scaffold(
            body: Center(
              child: Text("No Route"),
            ),
          ));
}
