import 'package:flutter/material.dart';
import 'package:period_calculator/models/app_colors.dart';
import 'package:period_calculator/ui/shared/custom_text.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final double? fontSize;

  const CustomElevatedButton(
      {super.key, required this.text, required this.onTap, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(AppColors.saffronYellow),
            elevation: const WidgetStatePropertyAll(1),
            minimumSize:
                const WidgetStatePropertyAll(Size(double.infinity, 50)),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)))),
        onPressed: onTap as void Function()?,
        child: CustomText(
          text: text,textColor: AppColors.textColor,
        ));
  }
}
