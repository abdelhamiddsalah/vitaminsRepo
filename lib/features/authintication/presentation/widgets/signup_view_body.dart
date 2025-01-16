import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:vitamins/constants/images.dart';
import 'package:vitamins/core/widgets/custom_button.dart';
import 'package:vitamins/core/widgets/custom_textfield.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset(Assets.imagesImageinauth),
          const SizedBox(height: 25.0),
          CustomTextfield(text: 'Name'),
          const SizedBox(height: 16.0),
          CustomTextfield(text: 'Email'),
          const SizedBox(height: 16.0),
          CustomTextfield(text: 'Password'),
          const SizedBox(height: 16.0),
          CustomButton(text: "Sign Up")
        ],
      ),
    );
  }
}