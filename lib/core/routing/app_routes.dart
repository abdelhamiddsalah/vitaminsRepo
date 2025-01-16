import 'package:flutter/material.dart';
import 'package:vitamins/core/routing/routes.dart';
import 'package:vitamins/features/authintication/presentation/signup_view.dart';

class AppRoutes {
Route? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.register:
      return MaterialPageRoute(builder: (context) => const SignupView());
    default:
      return null;
  }
}
}