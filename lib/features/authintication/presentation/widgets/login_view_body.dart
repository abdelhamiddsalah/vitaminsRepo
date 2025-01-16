import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:vitamins/constants/images.dart';
import 'package:vitamins/core/styles/text_styles.dart';
import 'package:vitamins/core/validations/validation.dart';
import 'package:vitamins/core/widgets/custom_button.dart';
import 'package:vitamins/core/widgets/custom_textfield.dart';
import 'package:vitamins/features/authintication/presentation/widgets/row_in_lastauth.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
           SvgPicture.asset(Assets.imagesImageinauth),
           const SizedBox(height: 25.0),
            CustomTextfield(text: 'Email',validator: Validation.validateEmail,),
            const SizedBox(height: 16.0),
            CustomTextfield(text: 'Password',validator: Validation.validatePassword,),
            const SizedBox(height: 16.0),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/forgetpassword');
                },
                child: Text('Forgot Password?',style: TextStyles.rowtext2.copyWith(fontSize: 16),))),
            const SizedBox(height: 20.0),
            CustomButton(text: "Sign In"),
            const SizedBox(height: 16.0),
            RowInLastauth(text1: "Don't have an account?", text2: "Sign Up",onPressed: (){
              Navigator.pushNamed(context, '/');
            },),  
        ]),
      ),
    );
  }
}