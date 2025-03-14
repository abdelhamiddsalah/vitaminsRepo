import 'package:go_router/go_router.dart';
import 'package:vitamins/core/routing/routes.dart';
import 'package:vitamins/features/authintication/presentation/forget_password_view.dart';
import 'package:vitamins/features/authintication/presentation/login_view.dart';
import 'package:vitamins/features/authintication/presentation/reset_password_view.dart';
import 'package:vitamins/features/authintication/presentation/signup_view.dart';
import 'package:vitamins/features/dashboard/presentation/dashboard_view.dart';
import 'package:vitamins/features/home/presentation/home_view.dart';
import 'package:vitamins/features/home/presentation/products_view.dart';
import 'package:vitamins/features/onboarding/presentation/onboarding_view.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.onboarding, // تحديد الصفحة الابتدائية
  routes: [
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: Routes.register,
      builder: (context, state) => const SignupView(),
    ),
    GoRoute(
      path: Routes.forgetpassword,
      builder: (context, state) => const ForgetPasswordView(),
    ),
    GoRoute(
      path: Routes.resetpassword,
      builder: (context, state) => ResetPasswordView(),
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: Routes.dashboard,
      builder: (context, state) => const DashboardView(),
    ),
    GoRoute(
      path: Routes.productspage,
      builder: (context, state) => const ProductsView(),
    ),
  ],
);
