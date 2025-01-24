import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vitamins/core/styles/text_styles.dart';

class Pageviewitem extends StatelessWidget {
  const Pageviewitem({
    super.key,
    required this.text1,
    required this.text2,
    required this.currentPage,
    required this.lottiepath,
  });

  final String text1;
  final String text2;
  final int currentPage;
  final String lottiepath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(
          lottiepath,
          height: 300,
          width: 300,
        ),
        const SizedBox(height: 10),
        Text(
          text1,
          style: TextStyles.text1inonboardin,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Text(
          text2,
          style: TextStyles.text2inonboardin,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          ],
        ),
      ],
    );
  }
}
