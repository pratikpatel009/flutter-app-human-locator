import 'package:shared_preferences/shared_preferences.dart';

class SharedServises {
  Future checkLogedIn(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var cache = prefs.getString(token);
    return cache;
  }
}