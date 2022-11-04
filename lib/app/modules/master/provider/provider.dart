import 'dart:convert';

import 'package:face_id_plus/app/modules/master/models/profile_user.dart';
import 'package:http/http.dart' as http;

class MasterProvider {
  Future<ProfileUserModel> getUserProfile(String? username) async {
    Uri url = Uri.parse(
        "https://lp.abpjobsite.com/api/v1/abpenergy/user/profile?username=$username");
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return ProfileUserModel.fromJson(objekJson);
  }
}
