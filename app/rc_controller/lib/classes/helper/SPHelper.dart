import 'package:shared_preferences/shared_preferences.dart';

class SP {
  static String? carID, email, password;

  // Save any value to shared pref
  static saveValueToSP(String key, var value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value.runtimeType == String) {
      prefs.setString(key, value);
    } else {
      
    }
  }

  // Retrieve login
  static Future<void> getLoginFromSP() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      // Get car id
      carID = prefs.getString('startTimePeriod');
      
      // Get login information
      email = prefs.getString('endTimePeriod');
      password = prefs.getString('endTimePeriod');
    } catch (ignored) {}
  }

  // Remove value from shared pref
  static Future<void> removeValueFromSP(String key) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      await prefs.remove(key);
    } catch (ignored) {}
  }
}