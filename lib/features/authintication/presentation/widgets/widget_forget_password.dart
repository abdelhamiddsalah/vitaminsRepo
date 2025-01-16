
import 'package:flutter/material.dart';
import 'package:vitamins/core/styles/text_styles.dart';

class ForgetPasswordInLogin extends StatelessWidget {
  const ForgetPasswordInLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/forgetpassword');
        },
        child: Text('Forgot Password?',style: TextStyles.rowtext2.copyWith(fontSize: 16),)));
  }
}