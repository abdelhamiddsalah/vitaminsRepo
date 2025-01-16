import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:vitamins/constants/images.dart';
import 'package:vitamins/core/validations/validation.dart';
import 'package:vitamins/core/widgets/custom_button.dart';
import 'package:vitamins/core/widgets/custom_textfield.dart';
import 'package:vitamins/features/authintication/presentation/widgets/row_in_lastauth.dart';
import 'package:vitamins/features/authintication/presentation/widgets/widget_forget_password.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 56.0),
      child: SingleChildScrollView (
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
             SvgPicture.asset(Assets.imagesImageinauth),
             const SizedBox(height: 25.0),
              CustomTextfield(text: 'Email',validator: Validation.validateEmail,),
              const SizedBox(height: 16.0),
              CustomTextfield(text: 'Password',validator: Validation.validatePassword,obscureText: true,),
              const SizedBox(height: 16.0),
              ForgetPasswordInLogin(),
              const SizedBox(height: 20.0),
              CustomButton(text: "Sign In"),
              const SizedBox(height: 16.0),
              RowInLastauth(text1: "Don't have an account?", text2: "Sign Up",onPressed: (){
                Navigator.pushNamed(context, '/');
              },),  
          ]),
        ),
      ),
    );
  }
}