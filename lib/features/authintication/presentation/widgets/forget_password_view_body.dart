import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vitamins/constants/images.dart';
import 'package:vitamins/core/routing/routes.dart';
import 'package:vitamins/core/styles/text_styles.dart';
import 'package:vitamins/core/validations/validation.dart';
import 'package:vitamins/core/widgets/custom_button.dart';
import 'package:vitamins/core/widgets/custom_textfield.dart';
import 'package:vitamins/core/widgets/failure_dialog.dart';
import 'package:vitamins/core/widgets/success_dialog.dart';
import 'package:vitamins/features/authintication/presentation/cubits/forgetpassword/forgetpassword/forgetpassword_cubit.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgetpasswordCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 56.0),
      child: SingleChildScrollView(
        child: Form(
          key: cubit.formKey,
          child: Column(
            children: [
              Image.asset(Assets.imagesLogomedical),
              const SizedBox(height: 25.0),
              CustomTextfield(
                text: 'Enter your email',
                validator: Validation.validateEmail,
                controller: cubit.emailController,
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                GoRouter.of(context).push(Routes.login);
                },
                child: Text(
                  'Back to Sign In',
                  style: TextStyles.rowtext2.copyWith(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              BlocConsumer<ForgetpasswordCubit, ForgetpasswordState>(
                listener: (context, state) {
                  if (state is ForgetpasswordSuccess) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SuccessDialog(
                          message: 'Check your email',
                          onPressed: () {
                          GoRouter.of(context).pop();
                          },
                        );
                      },
                    );
                  }
                  if (state is ForgetpasswordError) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return FailureDialog(message: state.message);
                      },
                    );
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    text: "Send",
                    onTap: cubit.forgetpassword,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
