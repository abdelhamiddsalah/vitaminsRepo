import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg.dart';
import 'package:vitamins/constants/images.dart';
import 'package:vitamins/core/validations/validation.dart';
import 'package:vitamins/core/widgets/custom_button.dart';
import 'package:vitamins/core/widgets/custom_textfield.dart';
import 'package:vitamins/features/authintication/presentation/cubits/signup/signupcubit/signup_cubit.dart';
import 'package:vitamins/features/authintication/presentation/widgets/row_in_lastauth.dart';
import 'user_type_dropdown.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 56.0),
      child: SingleChildScrollView(
        child: Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset(Assets.imagesImageinauth),
              const SizedBox(height: 25.0),
              CustomTextfield(
                text: 'Name',
                controller: cubit.nameController,
              ),
              const SizedBox(height: 16.0),
              CustomTextfield(
                text: 'Email',
                validator: Validation.validateEmail,
                controller: cubit.emailController,
              ),
              const SizedBox(height: 16.0),
              CustomTextfield(
                text: 'Password',
                obscureText: true,
                validator: Validation.validatePassword,
                controller: cubit.passwordController,
              ),
              const SizedBox(height: 20.0),
              UserTypeDropdown(
                onUserTypeChanged: cubit.updateUserType,
              ),
              const SizedBox(height: 22.0),
              BlocConsumer<SignupCubit, SignupState>(
                listener: (context, state) {
                  if (state is SignupSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Signup Successful!')),
                    );
                    Navigator.pushReplacementNamed(context, '/login');
                  } else if (state is SignupError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    text: state is SignupLoading ? "Loading..." : "Sign Up",
                    onTap: state is SignupLoading ? null : cubit.registerUser,
                  );
                },
              ),
              const SizedBox(height: 16.0),
              RowInLastauth(
                text1: "Already have an account?",
                text2: "Sign In",
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
