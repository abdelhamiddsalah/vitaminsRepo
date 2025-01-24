import 'package:flutter/material.dart';
import 'package:vitamins/features/dashboard/presentation/widgets/custom_appbar_dashboard.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children:  [
           CustomAppbarDashboard()
          ],
        ),
      ),
    );
  }
}