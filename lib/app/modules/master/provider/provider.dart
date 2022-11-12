import 'dart:convert';

import 'package:face_id_plus/app/modules/master/models/profile_user.dart';
import 'package:face_id_plus/app/modules/master/models/result_models.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class MasterProvider {
  Future<ProfileUserModel> getUserProfile(String? username) async {
    Uri url = Uri.parse(
        "https://lp.abpjobsite.com/api/v1/abpenergy/user/profile?username=$username");
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return ProfileUserModel.fromJson(objekJson);
  }

  Future<ResultModels?> postTTD(PostTtdModels data) async {
    var res = <String, dynamic>{};

    DateTime dt = DateTime.now();

    String filename =
        "${"${dt.hour}".padLeft(2, "0")}${"${dt.minute}".padLeft(2, "0")}${"${dt.second}".padLeft(2, "0")}_${data.username}_TTD.png";

    Uri uri =
        Uri.parse("https://lp.abpjobsite.com/api/v1/abpenergy/simpan/ttd");

    var request = http.MultipartRequest("POST", uri);

    request.files.add(http.MultipartFile.fromBytes(
        'ttd', await data.ttd!.readAsBytes(),
        filename: filename));
    request.fields['username'] = "${data.username}";
    var response = await request.send();
    await for (String s in response.stream.transform(utf8.decoder)) {
      if (kDebugMode) {
        print("response $s");
      }
      res = jsonDecode(s);
    }
    return ResultModels.fromJson(res);
  }
}
