import 'package:flutter/material.dart';
import 'package:vitamins/core/styles/text_styles.dart';

class RowInLastauth extends StatelessWidget {
  const RowInLastauth({super.key, required this.text1, required this.text2, this.onPressed});
 final String text1;
 final String text2;
 final  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(text1,style: TextStyles.rowtext1),
        TextButton(
          onPressed:onPressed,
          child:  Text(text2,style: TextStyles.rowtext2.copyWith(color: Colors.black),),
        ),
    ]);
  }
}