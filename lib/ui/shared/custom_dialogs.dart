import 'package:flutter/material.dart';
import 'package:period_calculator/models/app_colors.dart';
import 'package:period_calculator/models/validator_v1.dart';
import 'package:period_calculator/ui/shared/custom_elevated_button.dart';
import 'package:period_calculator/ui/shared/custom_text_field.dart';

class CustomDialogs {
 static GlobalKey<FormState> periodFormKey = GlobalKey();

  static dialogWithTextField(
      {required BuildContext context,
      String? label,
      required Function onTap,
      required TextEditingController controller}) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6))),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 100,
                        child: Divider(color: AppColors.mainYellow, thickness: 4),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        formKey: periodFormKey,
                          validator: ValidatorV1.emptyValueValidator,
                          keyboardType: TextInputType.number,
                          hintText: '',
                          label: label,
                          controller: controller),
                      const SizedBox(height: 15),
                      CustomElevatedButton(text: 'تعديل', onTap: (){
                        if (periodFormKey.currentState!.validate()) {
                          onTap();
                        }
                      })
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
