import 'dart:convert';

RegisterResponseModel registerResponseModel(String str) =>
    RegisterResponseModel.fromJson(json.decode(str));

class RegisterResponseModel {
  RegisterResponseModel({
    required this.username,
    required this.email,
    required this.password,
    required this.isAdmin,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String username;
  late final String email;
  late final String password;
  late final bool isAdmin;
  late final String id;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  RegisterResponseModel.fromJson(Map<String, dynamic> json){
    username = json['username'];
    email = json['email'];
    password = json['password'];
    isAdmin = json['isAdmin'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['email'] = email;
    _data['password'] = password;
    _data['isAdmin'] = isAdmin;
    _data['_id'] = id;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}