import 'package:flutter/material.dart';
import 'package:vitamins/core/styles/text_styles.dart';

class Titleinpages extends StatelessWidget {
  const Titleinpages({
    super.key,
    required this.text1,
  });

  final String? text1;

  @override
  Widget build(BuildContext context) {
    return Text(
      text1!,
      style: TextStyles.textinhomestack.copyWith(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
