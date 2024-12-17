import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:period_calculator/controller/period_controller.dart';

class HelpMeScreen extends StatefulWidget {
  const HelpMeScreen({super.key});

  @override
  State<HelpMeScreen> createState() => _HelpMeScreenState();
}

class _HelpMeScreenState extends State<HelpMeScreen> {
  PeriodController controller = Get.find<PeriodController>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('معلومات'),
        ),
        body: PdfView(
          scrollDirection: Axis.vertical,
            controller: controller.pdfController),
      ),
    );
  }
}
