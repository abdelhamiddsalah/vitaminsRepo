import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:vitamins/constants/images.dart';
import 'package:vitamins/core/widgets/custom_button.dart';
import 'package:vitamins/core/widgets/custom_textfield.dart';
import 'user_type_dropdown.dart'; // استيراد الويدجت الجديدة

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  String selectedUserType = 'User'; // القيمة الافتراضية

  void updateUserType(String userType) {
    setState(() {
      selectedUserType = userType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: SingleChildScrollView(
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
            const SizedBox(height: 20.0),
            UserTypeDropdown(onUserTypeChanged: updateUserType), // استخدام الويدجت
            const SizedBox(height: 22.0),
            CustomButton(text: "Sign Up"),
          ],
        ),
      ),
    );
  }
}
