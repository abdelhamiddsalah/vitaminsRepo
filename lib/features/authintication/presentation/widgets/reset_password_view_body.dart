import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitamins/constants/images.dart';
import 'package:vitamins/core/validations/validation.dart';
import 'package:vitamins/core/widgets/custom_button.dart';
import 'package:vitamins/core/widgets/custom_textfield.dart';
import 'package:vitamins/features/authintication/presentation/cubits/resetpassword/resetpassword/resetpassword_cubit.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ResetpasswordCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 56.0),
      child: SingleChildScrollView(
        child: Form(
          key: cubit.formkey,
          child: Column(
            children: [
             Image.asset(Assets.imagesLogomedical),
              const SizedBox(height: 25.0),
              CustomTextfield(
                text: 'Enter New Password',
                controller: cubit.passwordController,
                obscureText: true,
                validator: Validation.validatePassword,
              ),
              const SizedBox(height: 16.0),
              CustomTextfield(
                text: 'Confirm Password',
                controller: cubit.confirmPasswordController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != cubit.passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              CustomButton(
                text: 'Reset Password',
                onTap: cubit.resetpassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
