import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:vitamins/constants/images.dart';
import 'package:vitamins/core/styles/text_styles.dart';
import 'package:vitamins/core/validations/validation.dart';
import 'package:vitamins/core/widgets/custom_button.dart';
import 'package:vitamins/core/widgets/custom_textfield.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset(Assets.imagesImageinauth),
            const SizedBox(height: 25.0),
            CustomTextfield(text: 'Enter your email',validator: Validation.validateEmail,),
            const SizedBox(height: 16.0),
            TextButton(onPressed: (){
              Navigator.pushNamed(context, '/login');
            }, child: Text('Back to Sign In',style: TextStyles.rowtext2.copyWith(color: Colors.grey,fontSize: 16),)),
            const SizedBox(height: 20.0),
            CustomButton(text: "Send",),
          ],
        ),
      ),
    );
  }
}