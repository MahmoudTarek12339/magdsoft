import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/detailsScreen/details_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/helpScreen/help_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/homeScreen/home_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/splashScreen/splash_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/loginScreen/login_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/verificationScreen/verification_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String verifyRoute = "/verify";
  static const String helpRoute = "/help";
  static const String detailsRoute = "/details";
  static const String homeRoute = "/home";
}

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.verifyRoute:
        return MaterialPageRoute(builder: (_) => const VerificationScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.detailsRoute:
        return MaterialPageRoute(builder: (_) => const DetailsScreen());
      case Routes.helpRoute:
        return MaterialPageRoute(builder: (_) => const HelpScreen());
      default:
        return null;
    }
  }
}
