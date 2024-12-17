import 'package:flutter/material.dart';
import 'package:period_calculator/models/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String hintText;
  final String? label;
  final IconData? iconData;
  final bool isPassword;
  final int? maxLines;
  final bool isHasValidate;
  final Function? validator;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final Function? onIconTab;
  final GlobalKey<FormState>? formKey;

  const CustomTextField(
      {super.key,
      required this.hintText,
      this.keyboardType,
      this.iconData,
      this.isPassword = false,
      this.label,
      this.validator,
      this.maxLines,
      required this.controller,
      this.isHasValidate = false,
      this.onChanged,
      this.onEditingComplete,
      this.onIconTab,
      this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: label != null,
            child: Text(label!,
                style: const TextStyle(color: Colors.black54, fontSize: 14)),
          ),
          const SizedBox(height: 5),
          TextFormField(
              style: const TextStyle(fontSize: 14),
              keyboardType: keyboardType,
              onEditingComplete: onEditingComplete,
              onChanged: onChanged,
              controller: controller,
              validator:
                  validator as String? Function(String?)? ?? ((_) => null),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              maxLines: isPassword ? 1 : maxLines,
              obscureText: isPassword ? true : false,
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.darkRed),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.darkRed),
                  ),
                  hintText: hintText,
                  filled: true,
                  //fillColor: Colors.white,
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
                  suffixIcon: InkWell(
                    onTap: () => onIconTab != null ? onIconTab!() : null,
                    child: Icon(
                      iconData,
                      color: Colors.grey,
                    ),
                  ))),
        ],
      ),
    );
  }
}
