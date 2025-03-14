import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vitamins/constants/images.dart';
import 'package:vitamins/core/routing/routes.dart';
import 'package:vitamins/core/validations/validation.dart';
import 'package:vitamins/core/widgets/custom_button.dart';
import 'package:vitamins/core/widgets/custom_textfield.dart';
import 'package:vitamins/core/widgets/failure_dialog.dart';
import 'package:vitamins/features/authintication/presentation/cubits/login/logincubit/login_cubit.dart';
import 'package:vitamins/features/authintication/presentation/widgets/row_in_lastauth.dart';
import 'package:vitamins/features/authintication/presentation/widgets/widget_forget_password.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 56.0),
      child: SingleChildScrollView(
        child: Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                  Image.asset(Assets.imagesLogomedical),
              const SizedBox(height: 25.0),
              CustomTextfield(
                text: 'Email',
                validator: Validation.validateEmail,
                controller: cubit.emailController,
              ),
              const SizedBox(height: 16.0),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return CustomTextfield(
                    text: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        cubit.togglePasswordVisibility();
                      },
                      icon: Icon(
                        cubit.isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    validator: Validation.validatePassword,
                    obscureText: cubit.isPasswordVisible,
                    controller: cubit.passwordController,
                  );
                },
              ),
              const SizedBox(height: 16.0),
              ForgetPasswordInLogin(),
              const SizedBox(height: 20.0),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginError) {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          FailureDialog(message: state.message),
                    );
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    text: state is LoginLoading ? "Loading..." : "Log In",
                    onTap: state is LoginLoading
                        ? null
                        : () => cubit.loginUser(context),
                  );
                },
              ),
              const SizedBox(height: 16.0),
              RowInLastauth(
                text1: "Don't have an account?",
                text2: "Sign Up",
                onPressed: () {
                  GoRouter.of(context).push(Routes.home);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
