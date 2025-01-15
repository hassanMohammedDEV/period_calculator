import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:period_calculator/controller/period_controller.dart';
import 'package:period_calculator/models/app_colors.dart';
import 'package:period_calculator/models/global_methods.dart';
import 'package:period_calculator/models/validator_v1.dart';
import 'package:period_calculator/ui/help_me_screen.dart';
import 'package:period_calculator/ui/shared/custom_date_text_field.dart';
import 'package:period_calculator/ui/shared/custom_elevated_button.dart';
import 'shared/custom_text.dart';

class PeriodScreen extends StatefulWidget {
  const PeriodScreen({super.key});

  @override
  State<PeriodScreen> createState() => _PeriodScreenState();
}

class _PeriodScreenState extends State<PeriodScreen> {
  GlobalKey<FormState> periodStartDateForShowFormKey = GlobalKey();
  GlobalKey<FormState> purityStartDateForShowFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PeriodController>(
        init: PeriodController(),
        builder: (controller) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                title: const CustomText(text: 'حاسبة الدورة'),
                actions: [
                  IconButton(
                      onPressed: onHelpMe,
                      icon: const CustomText(text: 'معلومات'))
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: AppColors.mainYellow),
                                      height: 80,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CustomText(
                                              text: 'عدد أيام أقصر دورة',
                                              textColor: AppColors.textColor),
                                          const SizedBox(height: 5),
                                          CustomText(
                                              text: controller.shorterPeriod
                                                  .toString(),
                                              fontSize: 20,
                                              textColor: AppColors.textColor),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                        right: 0,
                                        bottom: 0,
                                        child: IconButton(
                                            iconSize: 20,
                                            icon: Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: AppColors.textColor,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: const Icon(
                                                size: 18,
                                                Icons.edit,
                                              ),
                                            ),
                                            onPressed: onEditShorterPeriod))
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: AppColors.mainYellow),
                                      height: 80,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CustomText(
                                              text: 'عدد أيام أطول دورة',
                                              textColor: AppColors.textColor),
                                          const SizedBox(height: 5),
                                          CustomText(
                                              text: controller.longerPeriod
                                                  .toString(),
                                              fontSize: 20,
                                              textColor: AppColors.textColor),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                        left: 0,
                                        bottom: 0,
                                        child: IconButton(
                                            iconSize: 20,
                                            icon: Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: AppColors.textColor,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: const Icon(
                                                size: 18,
                                                Icons.edit,
                                              ),
                                            ),
                                            onPressed:
                                                onEditLongerPeriodPeriod))
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            CustomDateTextField(
                                label: 'أول يوم في الدورة',
                                hintText: 'تاريخ أول يوم في الدورة',
                                formKey: periodStartDateForShowFormKey,
                                validator: ValidatorV1.emptyValueValidator,
                                onTap: () =>
                                    controller.showPeriodDatePiker(context),
                                controller: controller.periodStartDateForShow),
                            const SizedBox(height: 8),
                            CustomDateTextField(
                                label: 'أول يوم طهارة',
                                hintText: 'تاريخ إنقطاع الدم',
                                formKey: purityStartDateForShowFormKey,
                                validator: ValidatorV1.emptyValueValidator,
                                onTap: () =>
                                    controller.showPurityDatePiker(context),
                                controller: controller.purityStartDateForShow),

                            /// Report
                            if (controller.displayedReport) ...[
                              const SizedBox(height: 10),
                              const Divider(),
                              const SizedBox(height: 5),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomText(
                                      text: 'التفاصيل',
                                      textColor: Colors.black54),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border:
                                      Border.all(color: AppColors.mainYellow),
                                ),
                                child: Column(
                                  children: [
                                    if (controller.isHasFirstSafetyPeriod) ...[
                                      const CustomText(
                                          text: 'فترة أمان',
                                          textColor: Colors.green),
                                      const SizedBox(height: 4),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CustomText(
                                              text:
                                                  'من ${getDayName(controller.purityStartDate.weekday)} ${dateToStringDate(controller.purityStartDate)}',
                                              textColor: Colors.black54),
                                        ],
                                      ),
                                      const SizedBox(width: 4),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          CustomText(
                                              text:
                                                  'إلى ${getDayName(controller.toFirstSafetyPeriod.weekday)} ${dateToStringDate(controller.toFirstSafetyPeriod)}',
                                              textColor: Colors.black54),
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                    ],
                                    const CustomText(
                                        text: 'فترة خصوبة',
                                        textColor: Colors.redAccent),
                                    const SizedBox(height: 4),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomText(
                                            text:
                                                'من ${getDayName(controller.fertilityDate.weekday)} ${dateToStringDate(controller.fertilityDate)}',
                                            textColor: Colors.black54),
                                      ],
                                    ),
                                    const SizedBox(width: 4),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CustomText(
                                            text:
                                                'إلى ${getDayName(controller.lastFertilityDate.weekday)} ${dateToStringDate(controller.lastFertilityDate)}',
                                            textColor: Colors.black54),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    const CustomText(
                                      text: 'فترة أمان',
                                      textColor: Colors.green,
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomText(
                                            text:
                                                'من ${getDayName(controller.safetyDate.weekday)} ${dateToStringDate(controller.safetyDate)}',
                                            textColor: Colors.black54),
                                      ],
                                    ),
                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CustomText(
                                            text: 'إلى بداية الدورة الجديدة',
                                            textColor: Colors.black54),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    CustomElevatedButton(text: 'إحتساب', onTap: onTabCalculate)
                  ],
                ),
              ),
            ),
          );
        });
  }

  onTabCalculate() {
    bool periodValidate =
        periodStartDateForShowFormKey.currentState!.validate();

    bool purityValidate =
        purityStartDateForShowFormKey.currentState!.validate();

    if (periodValidate && purityValidate) {
      PeriodController controller = Get.find<PeriodController>();
      controller.onCalculate();
    }
  }

  void onEditShorterPeriod() {
    PeriodController controller = Get.find<PeriodController>();
    controller.onEditShorterPeriod(context);
  }

  void onEditLongerPeriodPeriod() {
    PeriodController controller = Get.find<PeriodController>();
    controller.onEditLongerPeriodPeriod(context);
  }

  void onHelpMe() {
    Get.to(const HelpMeScreen());
  }
}
