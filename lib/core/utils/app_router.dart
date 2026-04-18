import 'package:flutter/material.dart';


class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        // return MaterialPageRoute(builder: (_) => const DoorSplashScreen(child: SplashScreen()));
      case '/onboarding':
        // return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      
      default:
        // Return null for undefined routes
        return MaterialPageRoute(builder: (_) => const Scaffold(body: Text("Route not found")));
    }
  }
}
