import 'package:location_tracking/services/shared_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

getId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? id = pref.getString("id");
  return id;
}

 String id = getId();


class Config {

  static const String appName = "Human Locator";
  static const String loginAPI = "https://human-locator.herokuapp.com/api/auth/login";
  static const String registerAPI = "https://human-locator.herokuapp.com/api/auth/register";
  static  String addMemberAPI = "https://human-locator.herokuapp.com/api/user/"+id+"/mycircle";
  static  String getMemberAPI = "https://human-locator.herokuapp.com/api/user/member/"+id;
  static  String updateLocationAPI = "https://human-locator.herokuapp.com/api/user/"+id+"/location";
}