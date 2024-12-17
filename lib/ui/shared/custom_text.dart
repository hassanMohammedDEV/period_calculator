import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;

  const CustomText(
      {super.key, required this.text, this.textColor, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          height: 1.2,
          fontFamily: 'Janna LT Bold',
          fontSize: fontSize,
          color: textColor,
        ));
  }
}
