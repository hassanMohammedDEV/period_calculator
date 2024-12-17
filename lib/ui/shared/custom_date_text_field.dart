import 'package:flutter/material.dart';
import 'package:period_calculator/models/app_colors.dart';
import 'package:period_calculator/ui/shared/custom_text.dart';

class CustomDateTextField extends StatelessWidget {
  final String? label;
  final String hintText;
  final TextEditingController controller;
  final Function onTap;
  final double? height;
  final Function? validator;
  final GlobalKey<FormState>? formKey;

  const CustomDateTextField(
      {super.key,
      this.label,
      required this.hintText,
      required this.onTap,
      this.validator,
      this.height,
      required this.controller, this.formKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
            visible: label != null,
            child: CustomText(text: label!,textColor: Colors.black54,)),
        const SizedBox(height: 4),
        Form(
          key: formKey,
          child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validator as String? Function(String?)? ?? ((_) => null),
              readOnly: true,
              onTap: onTap as void Function()?,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
              controller: controller,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.darkRed),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.darkRed),
                ),
                hintText: hintText,
                filled: true,
                //fillColor: Colors.white,
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
                suffixIcon: const Icon(
                  Icons.calendar_month_outlined,
                  size: 18,
                  color: Colors.grey,
                ),
              )),
        ),
      ],
    );
  }
}
