

import 'dart:convert';

UpdateLocationResponseModel updateLocationResponseModel(String str) =>
    UpdateLocationResponseModel.fromJson(json.decode(str));


class UpdateLocationResponseModel {
  UpdateLocationResponseModel({
    required this.id,
    required this.username,
    required this.email,
    required this.issharing,
    required this.lat,
    required this.lng,
    required this.password,
    required this.isAdmin,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
    required this.mycircles,
  });
  late final String id;
  late final String username;
  late final String email;
  late final bool issharing;
  late final double lat;
  late final double lng;
  late final String password;
  late final bool isAdmin;
  late final String createdAt;
  late final String updatedAt;
  late final int V;
  late final List<Mycircles> mycircles;

  UpdateLocationResponseModel.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    username = json['username'];
    email = json['email'];
    issharing = json['issharing'];
    lat = json['lat'];
    lng = json['lng'];
    password = json['password'];
    isAdmin = json['isAdmin'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
    mycircles = List.from(json['mycircles']).map((e)=>Mycircles.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['username'] = username;
    _data['email'] = email;
    _data['issharing'] = issharing;
    _data['lat'] = lat;
    _data['lng'] = lng;
    _data['password'] = password;
    _data['isAdmin'] = isAdmin;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    _data['mycircles'] = mycircles.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Mycircles {
  Mycircles({
    required this.userName,
  });
  late final UserName? userName;

  Mycircles.fromJson(Map<String, dynamic> json){
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userName'] = userName;
    return _data;
  }
}

class UserName {
  UserName({
    required this.mycircles,
    required this.id,
    required this.username,
    required this.email,
    required this.issharing,
    required this.lat,
    required this.lng,
    required this.password,
    required this.isAdmin,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final List<dynamic> mycircles;
  late final String id;
  late final String username;
  late final String email;
  late final bool issharing;
  late final int lat;
  late final int lng;
  late final String password;
  late final bool isAdmin;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  UserName.fromJson(Map<String, dynamic> json){
    mycircles = List.castFrom<dynamic, dynamic>(json['mycircles']);
    id = json['_id'];
    username = json['username'];
    email = json['email'];
    issharing = json['issharing'];
    lat = json['lat'];
    lng = json['lng'];
    password = json['password'];
    isAdmin = json['isAdmin'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['mycircles'] = mycircles;
    _data['_id'] = id;
    _data['username'] = username;
    _data['email'] = email;
    _data['issharing'] = issharing;
    _data['lat'] = lat;
    _data['lng'] = lng;
    _data['password'] = password;
    _data['isAdmin'] = isAdmin;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}