import 'package:http/http.dart' as http;
import 'package:location_tracking/config.dart';
import 'package:location_tracking/model/fetch_member_response_model.dart';

class RemoteService {
  Future<FatchMemberResponseJson> getMember() async{
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var client = http.Client();

    var url = Uri.parse(Config.getMemberAPI);
    var response = await client.get(url);
    if(response.statusCode == 200)
    {
      var json = response.body;
      return fatchMemberResponseJson(json);

    }
    return fatchMemberResponseJson(response.body);
  }
}