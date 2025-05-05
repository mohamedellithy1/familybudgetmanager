import 'package:familybudgetmanager/features/home/presentation/home_screen.dart';
import 'package:familybudgetmanager/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return {
      '/splash': (context) => const SplashScreen(),
      '/home': (context) => const HomeScreen(),
    };
  }
}
