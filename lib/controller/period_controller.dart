import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:period_calculator/models/global_methods.dart';
import 'package:period_calculator/models/service/local_storage_data.dart';
import 'package:period_calculator/ui/shared/custom_dialogs.dart';

class PeriodController extends GetxController {
  int shorterPeriod = 27, longerPeriod = 31;

  TextEditingController periodStartDateForShow = TextEditingController();
  TextEditingController purityStartDateForShow = TextEditingController();

  TextEditingController longerPeriodController = TextEditingController();
  TextEditingController shorterPeriodController = TextEditingController();

  late DateTime _periodStartDate, _purityStartDate, _fertilityDate, _safetyDate;

  DateTime get periodStartDate => _periodStartDate;

  DateTime get purityStartDate => _purityStartDate;

  DateTime get fertilityDate => _fertilityDate;

  DateTime get safetyDate => _safetyDate;

  bool displayedReport = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    initScreen();
  }

  /// Methods
  Future showPeriodDatePiker(BuildContext context) async {
    final DateTime? dateTime = await showDatePicker(
        currentDate: DateTime.now(),
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(3000));

    if (dateTime != null) {
      onChangeSelectedPeriodDate(dateTime);
    }
  }

  onChangeSelectedPeriodDate(DateTime selectedDate) {
    displayedReport = false;

    _periodStartDate =
        DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
    periodStartDateForShow.text =
        getDayName(selectedDate.weekday) + dateToStringDate(selectedDate);

    // clear purity date
    purityStartDateForShow.clear();
    update();
  }

  Future showPurityDatePiker(BuildContext context) async {
    final DateTime? dateTime = await showDatePicker(
        currentDate: DateTime.now(),
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(3000));

    if (dateTime != null) {
      if (dateTime.difference(periodStartDate).inDays > 5) {
        onChangeSelectedPurityDate(dateTime);
      } else {
        Get.showSnackbar(const GetSnackBar(
            message: 'فترة خاطئة',
            duration: Duration(milliseconds: 1500),
            backgroundColor: Colors.redAccent));
      }
    }
  }

  onChangeSelectedPurityDate(DateTime selectedDate) {
    displayedReport = false;

    _purityStartDate =
        DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
    purityStartDateForShow.text =
        getDayName(selectedDate.weekday) + dateToStringDate(selectedDate);
    update();
  }

  onCalculate() {
    displayedReport = true;

    /// fertility calculate
    int fertility = shorterPeriod - 18;
    _fertilityDate = periodStartDate.add(Duration(days: fertility));

    /// safet calculate
    int safet = longerPeriod - 11;
    _safetyDate = periodStartDate.add(Duration(days: safet));

    update();
  }

  Future getShorterPeriod() async {
    LocalStorageData storageData = LocalStorageData();
    shorterPeriod = await storageData.getShorterPeriod() ?? 27;
  }

  Future setShorterPeriod(int shorterPeriod) async {
    LocalStorageData storageData = LocalStorageData();
    await storageData.setShorterPeriod(shorterPeriod);
  }

  Future getLongerPeriod() async {
    LocalStorageData storageData = LocalStorageData();
    longerPeriod = await storageData.getLongerPeriod() ?? 31;
  }

  Future setLongerPeriod(int longerPeriod) async {
    LocalStorageData storageData = LocalStorageData();
    await storageData.setLongerPeriod(longerPeriod);
  }

  initScreen() async {
    await getShorterPeriod();
    await getLongerPeriod();
    update();
  }

  void onEditShorterPeriod(BuildContext context) {
    shorterPeriodController.text = shorterPeriod.toString();
    CustomDialogs.dialogWithTextField(
        label: 'عدد أيام أقصر دورة',
        context: context,
        onTap: () async {
          await setShorterPeriod(int.parse(shorterPeriodController.text));
          shorterPeriod = int.parse(shorterPeriodController.text);
          update();
          if (context.mounted) {
            Navigator.pop(context);
          }
        },
        controller: shorterPeriodController);
  }

  void onEditLongerPeriodPeriod(BuildContext context) {
    longerPeriodController.text = longerPeriod.toString();
    CustomDialogs.dialogWithTextField(
        label: 'عدد أيام أطول دورة',
        context: context,
        onTap: () async {
          await setLongerPeriod(int.parse(longerPeriodController.text));
          longerPeriod = int.parse(longerPeriodController.text);
          update();
          if (context.mounted) {
            Navigator.pop(context);
          }
        },
        controller: longerPeriodController);
  }

  final pdfController = PdfController(
    document: PdfDocument.openAsset('assets/help_me.pdf'),
  );

  DateTime get toFirstSafetyPeriod =>
      fertilityDate.subtract(const Duration(days: 1));

  DateTime get lastFertilityDate =>
      safetyDate.subtract(const Duration(days: 1));
}
