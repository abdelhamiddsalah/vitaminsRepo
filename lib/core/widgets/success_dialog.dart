import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vitamins/core/styles/text_styles.dart';

class SuccessDialog extends StatelessWidget {
  final String message;
  final void Function()? onPressed;

  const SuccessDialog({super.key, required this.message, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
         Lottie.asset(
            'assets/images/Animation - 1737271616999.json', // Path to your Lottie animation file
            width: 90, // Size of the animation
            height: 90,
          ),
        ],
      ),
      content: Text(message,style: TextStyles.butontext, textAlign: TextAlign.center,),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: Text('OK',style: TextStyles.rowtext2.copyWith(color: Colors.black),),
        ),
      ],
    );
  }
}
