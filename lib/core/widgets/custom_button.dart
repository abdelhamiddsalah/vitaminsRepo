import 'package:flutter/material.dart';
import 'package:vitamins/core/styles/colorss.dart';
import 'package:vitamins/core/styles/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      child: Container(
        height: 50.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colorss.primaryColor,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Center(child: Text(text, style: TextStyles.butontext.copyWith(color: Colors.white),),),
      )
    );
  }
}