import 'package:flutter/material.dart';
import 'package:vitamins/features/authintication/presentation/widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: ForgetPasswordViewBody()));
  }
}