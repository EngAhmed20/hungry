import 'package:flutter/material.dart';
import 'package:hungry/core/utils/pref_helper.dart';
import 'package:hungry/core/utils/service_locator.dart';
import 'package:hungry/features/auth/data/auth_repo.dart';
import 'package:hungry/features/auth/view/login.dart';
import 'package:hungry/features/auth/view/sign_up.dart';
import 'package:hungry/features/checkout/view/checkout_view.dart';
import 'package:hungry/splash.dart';
import '../../features/product/view/product_details_view.dart';
import '../../root.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  // Placeholder for route generation logic
switch(settings.name) {
  case SplashView.routeName:
      return MaterialPageRoute(builder: (_) =>  SplashView(prefHelper:getIt.get<PrefHelper>() ,));

  case LoginView.routeName:
      return MaterialPageRoute(builder: (_) =>  LoginView(authRepo:getIt.get<AuthRepo>(),));
  case SignUpView.routeName:
      return MaterialPageRoute(builder: (_) =>  SignUpView(authRepo: getIt.get<AuthRepo>(),));
  case Root.routeName:
      return MaterialPageRoute(builder: (_) =>  Root());
  case ProductDetailsView.routeName:
      return MaterialPageRoute(builder: (_) => const ProductDetailsView());
  case CheckoutView.routeName:
      return MaterialPageRoute(builder: (_) => const CheckoutView());

    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}