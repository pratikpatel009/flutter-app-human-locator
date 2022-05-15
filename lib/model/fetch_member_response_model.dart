import 'dart:convert';

import 'dart:ffi';

FatchMemberResponseJson fatchMemberResponseJson(String str) =>
    FatchMemberResponseJson.fromJson(json.decode(str));

class FatchMemberResponseJson {
  FatchMemberResponseJson({
    required this.id,
    required this.username,
    required this.email,
    required this.issharing,
    required this.password,
    required this.isAdmin,
    required this.mycircles,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String id;
  late final String username;
  late final String email;
  late final bool issharing;
  late final String password;
  late final bool isAdmin;
  late final List<Mycircles> mycircles;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  FatchMemberResponseJson.fromJson(Map<String, dynamic> json){
    id = json['id'];
    username = json['username'];
    email = json['email'];
    issharing = json['issharing'];
    password = json['password'];
    isAdmin = json['isAdmin'];
    mycircles = List.from(json['mycircles']).map((e)=>Mycircles.fromJson(e)).toList();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['_v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['username'] = username;
    _data['email'] = email;
    _data['issharing'] = issharing;
    _data['password'] = password;
    _data['isAdmin'] = isAdmin;
    _data['mycircles'] = mycircles.map((e)=>e.toJson()).toList();
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['_v'] = V;
    return _data;
  }
}

class Mycircles {
  Mycircles({
    required this.id,
    required this.username,
    required this.issharing,
  });
  late final String id;
  late final String username;
  late final bool issharing;

  Mycircles.fromJson(Map<String, dynamic> json){
    id = json['id'];
    username = json['username'];
    issharing = json['issharing'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['username'] = username;
    _data['issharing'] = issharing;
    return _data;
  }
}