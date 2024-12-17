import 'package:get/get.dart';

class ValidatorV1 {
  static String? emptyValueValidator(String? val) {
    String value = val?.trim() ?? '';
    if (value.isEmpty) {
      return 'حقل إجباري';
    }
    return null;
  }

}
