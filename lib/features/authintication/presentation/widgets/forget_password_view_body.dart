import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg.dart';
import 'package:vitamins/constants/images.dart';
import 'package:vitamins/core/styles/text_styles.dart';
import 'package:vitamins/core/validations/validation.dart';
import 'package:vitamins/core/widgets/custom_button.dart';
import 'package:vitamins/core/widgets/custom_textfield.dart';
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
              SvgPicture.asset(Assets.imagesImageinauth),
              const SizedBox(height: 25.0),
              CustomTextfield(
                text: 'Enter your email',
                validator: Validation.validateEmail,
                controller: cubit.emailController,
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
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
 ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('check Your email!')),
                    );
                  
                  }
                  if (state is ForgetpasswordError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return CustomButton(text: "Send", onTap: cubit.forgetpassword,);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
