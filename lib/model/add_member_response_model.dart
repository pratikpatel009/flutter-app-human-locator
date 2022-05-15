import 'dart:convert';

AddMemberResponseModel addMemberResponseJson(String str) =>
    AddMemberResponseModel.fromJson(json.decode(str));

class AddMemberResponseModel {
  AddMemberResponseModel({
    required this.message,
  });
  late final String message;

  AddMemberResponseModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    return _data;
  }
}

