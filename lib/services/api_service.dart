import 'package:list_with_fav/models/user_data.dart';
import 'package:http/http.dart' as http;
import 'package:list_with_fav/preferenceManager/pref_manager.dart';

class ApiServices {
  static var client = http.Client();
  static String USER_JSON = 'user_json';
  static var userJson = '';

  static Future<List<UserData>> getListService() async {
    userJson = await PreferenceManager().getStringFromPref(USER_JSON);

    if (userJson != null) {
      print('LOADING .......DATA......FROM......LOCAL PREF');
      return userDataFromJson(userJson);
    } else {
      print('LOADING .......DATA......FROM......API');
      var response = await client
          .get('https://jsonplaceholder.typicode.com/comments?postId=1');
      print('Response=====');
      print(response);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        print(jsonString.toString());

        PreferenceManager().addStringToPref(USER_JSON, jsonString.toString());

        return userDataFromJson(jsonString);
      } else {
        return null;
      }
    }
  }
}
