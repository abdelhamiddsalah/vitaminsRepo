import 'package:flutter/material.dart';
import 'package:vitamins/core/routing/routes.dart';
import 'package:vitamins/features/authintication/presentation/forget_password_view.dart';
import 'package:vitamins/features/authintication/presentation/login_view.dart';
import 'package:vitamins/features/authintication/presentation/signup_view.dart';
import 'package:vitamins/features/home/presentation/home_view.dart';

class AppRoutes {
Route? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.register:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case Routes.login:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case Routes.forgetpassword:
      return MaterialPageRoute(builder: (context) => const ForgetPasswordView());
       case Routes.home:
      return MaterialPageRoute(builder: (context) => const HomeView());
    default:
      return null;
  }
}
}