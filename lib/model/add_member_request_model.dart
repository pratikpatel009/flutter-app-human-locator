class AddMemberRequestModel {
  AddMemberRequestModel({
    required this.username,
  });
  late final String username;

  AddMemberRequestModel.fromJson(Map<String, dynamic> json){
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    return _data;
  }
}