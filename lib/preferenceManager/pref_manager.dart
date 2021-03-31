import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  SharedPreferences prefs;
  static PreferenceManager _instance;

  addStringToPref(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

addListToPref(String key, List value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, value);
  }

  addIntToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('intValue', 123);
  }

  /************************ Get Data *****************************/

  Future<String> getStringFromPref(String key) async {
    prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString(key);
    return stringValue;
  }

  Future<List> getListFromPref(String key) async {
    prefs = await SharedPreferences.getInstance();
    List stringValue = prefs.getStringList(key);
    return stringValue;
  }

  /*********************** Remove Data *************************/

  removeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Remove String
    prefs.remove("stringValue");
    //Remove bool
    prefs.remove("boolValue");
    //Remove int
    prefs.remove("intValue");
    //Remove double
    prefs.remove("doubleValue");
  }

  clearAllValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
