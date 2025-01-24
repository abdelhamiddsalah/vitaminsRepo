import 'package:flutter/material.dart';
import 'package:vitamins/core/styles/colorss.dart';
import 'package:vitamins/core/styles/text_styles.dart';
import 'package:vitamins/core/widgets/title_in_pages.dart';

class Rowtextsinhomepage extends StatelessWidget {
  final String? text1;
  final String? text2;
  final VoidCallback? onTap;
  const Rowtextsinhomepage({
    super.key, this.text1, this.text2, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Titleinpages(text1: text1),
        GestureDetector(
          onTap: onTap,
          child: Text(
            text2!,
            style: TextStyles.textinhomestack.copyWith(
              color: Colorss.primaryColor,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}