import 'package:familybudgetmanager/features/splash/splash_screen.dart';
import 'package:familybudgetmanager/route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FamilyBudgetManager());
}

class FamilyBudgetManager extends StatelessWidget {
  final String initialRoute = '/splash';
  const FamilyBudgetManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: initialRoute,
      routes: Routes.getRoute(),
      home: const SplashScreen(),
    );
  }
}
