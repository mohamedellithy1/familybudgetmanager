import 'package:familybudgetmanager/features/splash/splash_screen.dart';
import 'package:familybudgetmanager/injection_container.dart';
import 'package:familybudgetmanager/route.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final injectionContainer = InjectionContainer();
  await injectionContainer.init();
  await Supabase.initialize(
    url: 'https://kxgdwfwaoqiyaugqrvya.supabase.co', // حط رابط مشروعك هنا
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt4Z2R3Zndhb3FpeWF1Z3FydnlhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY0MzY2MzMsImV4cCI6MjA2MjAxMjYzM30.q0Z9Y8vqplvqKsADn8FGtMKg2eTVtZYUE8RvvvD-Jzs', // حط الـ anon key هنا
  );

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
