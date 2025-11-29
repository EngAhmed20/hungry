import 'package:flutter/material.dart';
import 'package:hungry/features/auth/view/login.dart';
import 'package:hungry/splash.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  // Placeholder for route generation logic
switch(settings.name) {
  case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());

  case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}