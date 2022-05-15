import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:location_tracking/config.dart';
import 'package:location_tracking/model/add_member_request_model.dart';
import 'package:location_tracking/model/add_member_response_model.dart';
import 'package:location_tracking/model/login_request_model.dart';
import 'package:location_tracking/model/login_response_model.dart';
import 'package:location_tracking/model/register_request_model.dart';
import 'package:location_tracking/model/register_response_model.dart';
import 'package:location_tracking/model/update_location_request_model.dart';
import 'package:location_tracking/model/update_location_response_model.dart';

import '../model/fetch_member_response_model.dart';


class APIService {
  static var client = http.Client();

  static Future<LoginResponseModel> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse(Config.loginAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    print(response.body);
    var ldetail = loginResponseJson(response.body);
    return ldetail;
  }

  static Future<RegisterResponseModel> register(
      RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.parse(Config.registerAPI);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return registerResponseModel(response.body);
  }

  // location Update

  static Future<UpdateLocationResponseModel> updateLocation(
      UpdateLocationRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.parse(Config.updateLocationAPI);
    var response = await client.put(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return updateLocationResponseModel(response.body);
  }

  static Future<AddMemberResponseModel> addMember(
      AddMemberRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse(Config.addMemberAPI);
    var response = await client.put(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    print(response.body);

    // return registerResponseModel(response.body);
    return addMemberResponseJson(response.body,);
  }
// fetch member
  static Future<FatchMemberResponseJson> fetchMember() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse(Config.getMemberAPI);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );
    if(response.statusCode == 200)
      {
        var json = response.body;
        return fatchMemberResponseJson(json);

      }

    // return registerResponseModel(response.body);
     return fatchMemberResponseJson(response.body);
  }



  // static Future<List<dynamic>> getMember() async {
  //   try {
  //     Uri requestPath = Uri.parse(
  //         "https://human-locator.herokuapp.com/api/user/member/6273f270c83b3d868b9e0231");
  //     var response = await http.get(requestPath);
  //     var decodedResponse = jsonDecode(response.body);
  //     return fatchMemberResponseJson(response.body,);
  //   } on Exception {
  //     return [];
  //   }
  //
  // }
}