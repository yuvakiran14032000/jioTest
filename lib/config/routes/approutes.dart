import 'package:flutter/material.dart';
import 'package:jioyathri/features/authentication/presentation/pages/customer_profile_setup.dart';
import 'package:jioyathri/features/authentication/presentation/pages/login_screen.dart';
import 'package:jioyathri/features/authentication/presentation/pages/registration_screen.dart';
import 'package:jioyathri/features/services/presentation/pages/services.dart';

class AppRouter {
  static const String loginRoute = '/login';
  static const String registerRoute = '/registration';
  static const String servicesRoute = '/customerservise';
  static const String profilesetupRoute = 'profilesetup';

  static Route<dynamic> gererateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case registerRoute:
        return MaterialPageRoute(builder: (_) => RegistrationScreen());
      case servicesRoute:
        return MaterialPageRoute(builder: (_) => Services());
      case profilesetupRoute:
        return MaterialPageRoute(builder: (_) => CustomerProfileSetup());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text('No page found'))),
        );
    }
  }
}
