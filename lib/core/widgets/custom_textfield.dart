// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:vitamins/core/styles/text_styles.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key, required this.text, this.validator, this.obscureText=false});
  final String text;
  final String? Function(String?)? validator;
  final bool obscureText ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide.none,
        ),
        hintText: text,
        filled: true,
        fillColor: Colors.grey[200],
        hintStyle: TextStyles.formtext,
      ),
    );
  }
}
