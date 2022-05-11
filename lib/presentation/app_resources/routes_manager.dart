import 'package:afalmi/presentation/app_resources/strings_manager.dart';
import 'package:afalmi/presentation/onboarding/OnBoardingView.dart';
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
  static const String onBoardingRoute = "/onBoarding";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() => MaterialPageRoute(
      builder: (_) => const Scaffold(
            body: Center(
              child: Text(AppStrings.noRouteFound),
            ),
          ));
}
