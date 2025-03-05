import 'package:flutter/material.dart';
import 'package:vitamins/core/routing/routes.dart';
import 'package:vitamins/features/authintication/presentation/forget_password_view.dart';
import 'package:vitamins/features/authintication/presentation/login_view.dart';
import 'package:vitamins/features/authintication/presentation/reset_password_view.dart';
import 'package:vitamins/features/authintication/presentation/signup_view.dart';
import 'package:vitamins/features/dashboard/presentation/dashboard_view.dart';
import 'package:vitamins/features/home/presentation/home_view.dart';
import 'package:vitamins/features/home/presentation/products_view.dart';
import 'package:vitamins/features/onboarding/presentation/onboarding_view.dart';

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
    case Routes.dashboard:
      return MaterialPageRoute(builder: (context) => const DashboardView());
    case Routes.resetpassword:
      return MaterialPageRoute(builder: (context) =>  ResetPasswordView());
    case Routes.productspage:
     return MaterialPageRoute(builder: (context) => const ProductsView());
    case Routes.onboarding:
      return MaterialPageRoute(builder: (context) => const OnboardingView());
    default:
      return null;
  }
}
}