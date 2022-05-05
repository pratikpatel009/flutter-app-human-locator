import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:location_tracking/config.dart';
import 'package:location_tracking/model/login_request_model.dart';
import 'package:location_tracking/model/login_response_model.dart';
import 'package:location_tracking/model/register_request_model.dart';
import 'package:location_tracking/model/register_response_model.dart';


class APIService {
  static var client = http.Client();

  static Future<LoginResponseModel> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse(Config.loginAPI);

    var responce = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    print(responce.body);

    return loginResponseJson(responce.body);
  }

  static Future<RegisterResponseModel> register(
      RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse(Config.registerAPI);

    var responce = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return registerResponseModel(responce.body);
  }
}