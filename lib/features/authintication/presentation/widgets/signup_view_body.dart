import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:vitamins/constants/images.dart';
import 'package:vitamins/core/validations/validation.dart';
import 'package:vitamins/core/widgets/custom_button.dart';
import 'package:vitamins/core/widgets/custom_textfield.dart';
import 'package:vitamins/features/authintication/presentation/widgets/row_in_lastauth.dart';
import 'user_type_dropdown.dart'; // استيراد الويدجت الجديدة

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  String selectedUserType = 'User'; // القيمة الافتراضية

  // دالة لتحديث نوع المستخدم عند التغيير
  void updateUserType(String userType) {
    setState(() {
      selectedUserType = userType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 56.0),
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset(Assets.imagesImageinauth),
              const SizedBox(height: 25.0),
              CustomTextfield(text: 'Name'),
              const SizedBox(height: 16.0),
              CustomTextfield(text: 'Email', validator: Validation.validateEmail),
              const SizedBox(height: 16.0),
              CustomTextfield(
                text: 'Password',
                obscureText: true,
                validator: Validation.validatePassword,
              ),
              const SizedBox(height: 20.0),
              // إضافة ويدجت UserTypeDropdown
              UserTypeDropdown(
                onUserTypeChanged: updateUserType, // تم تمرير الدالة لتحديث النوع
              ),
              const SizedBox(height: 22.0),
              CustomButton(text: "Sign Up"),
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
