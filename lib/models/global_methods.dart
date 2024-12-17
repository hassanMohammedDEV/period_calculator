import 'package:intl/intl.dart';

String dateToStringDate(DateTime val) {
  return DateFormat("yyyy/MM/dd", 'en-US').format(val);
}

String getDayName(int day) {
  String dayName;
  switch (day) {
    case DateTime.monday:
      dayName = 'الاثنين';
      break;
    case DateTime.tuesday:
      dayName = 'الثلاثاء';
      break;
    case DateTime.wednesday:
      dayName = 'الاربعاء';
      break;
    case DateTime.thursday:
      dayName = 'الخميس';
      break;
    case DateTime.friday:
      dayName = 'الجمعة';
      break;
    case DateTime.saturday:
      dayName = 'السبت';
      break;
    case DateTime.sunday:
      dayName = 'الاحد';
      break;
    default:
      dayName = '';
  }
  return dayName;
}