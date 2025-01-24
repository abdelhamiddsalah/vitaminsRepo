import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vitamins/core/styles/text_styles.dart';

class FailureDialog extends StatelessWidget {
  final String message;

  const FailureDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
         Lottie.asset(
            'assets/images/Animation - 1737272352912.json', // Path to your Lottie animation file
            width: 90, // Size of the animation
            height: 90,
          ),
        ],
      ),
      content: Text(message,style: TextStyles.butontext, textAlign: TextAlign.center,),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('OK',style: TextStyles.rowtext2.copyWith(color: Colors.black),),
        ),
      ],
    );
  }
}
