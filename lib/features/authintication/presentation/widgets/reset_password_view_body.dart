import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:vitamins/constants/images.dart';
import 'package:vitamins/core/validations/validation.dart';
import 'package:vitamins/core/widgets/custom_button.dart';
import 'package:vitamins/core/widgets/custom_textfield.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 56.0),
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              SvgPicture.asset(Assets.imagesImageinauth),
              const SizedBox(height: 25.0),
              CustomTextfield(text: 'Enter New Password',validator: Validation.validatePassword,),
              const SizedBox(height: 16.0),
              CustomTextfield(text: 'Confirm New Password',validator: Validation.validatePassword,),
              const SizedBox(height: 20.0),
              CustomButton(text: "Reset",),
            ],
          ),
        ),
      ),
    );
  }
}