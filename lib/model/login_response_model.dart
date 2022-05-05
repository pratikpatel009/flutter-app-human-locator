import 'dart:convert';

LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  LoginResponseModel({
    required this.id,
    required this.username,
    required this.email,
    required this.isAdmin,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
    required this.accessToken,
  });
  late final String id;
  late final String username;
  late final String email;
  late final bool isAdmin;
  late final String createdAt;
  late final String updatedAt;
  late final int V;
  late final String accessToken;

  LoginResponseModel.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    username = json['username'];
    email = json['email'];
    isAdmin = json['isAdmin'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['username'] = username;
    _data['email'] = email;
    _data['isAdmin'] = isAdmin;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    _data['accessToken'] = accessToken;
    return _data;
  }
}