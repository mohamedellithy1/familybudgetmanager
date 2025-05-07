import 'package:familybudgetmanager/features/auth/login/presentation/cuibit/cubit.dart';
import 'package:familybudgetmanager/features/auth/login/presentation/screen/login_screen.dart';
import 'package:familybudgetmanager/features/home/presentation/screen/home_screen.dart';
import 'package:familybudgetmanager/features/splash/splash_screen.dart';
import 'package:familybudgetmanager/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return {
      '/splash': (context) => const SplashScreen(),
      '/login':
          (context) => BlocProvider(
            create: (context) => sl<LoginCubit>(),
            child: const LoginScreen(),
          ),
      '/home': (context) => HomeScreen(),
    };
  }
}
