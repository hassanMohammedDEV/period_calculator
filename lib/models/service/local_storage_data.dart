import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData {
  Future setShorterPeriod(int shorterPeriod) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('shorterPeriod', shorterPeriod);
  }

  Future<int?> getShorterPeriod() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('shorterPeriod');
  }

  Future setLongerPeriod(int longerPeriod) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('longerPeriod', longerPeriod);
  }

  Future<int?> getLongerPeriod() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('longerPeriod');
  }
}
