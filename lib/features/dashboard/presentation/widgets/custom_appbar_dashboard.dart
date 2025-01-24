import 'package:flutter/material.dart';
import 'package:vitamins/core/styles/text_styles.dart';

class CustomAppbarDashboard extends StatelessWidget {
  const CustomAppbarDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
      SizedBox(width: 10,),
      Text('Welcome Admin!',style: TextStyles.rowtext2,),
    ]);
  }
}