import 'package:flutter/material.dart';
import 'package:vitamins/core/styles/text_styles.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key, required this.text});
 final String text;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      decoration:  InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide.none,
        ),
       hintText:text,
        filled: true,
        fillColor: Colors.grey[200],
        hintStyle: TextStyles.formtext
      ),

    );
  }
}