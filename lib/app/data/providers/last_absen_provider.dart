import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:face_id_plus/app/data/models/last_absen_models.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class LastAbsenProvider extends GetConnect {
  Future<LastAbsenModels?> getLastAbsen(String nik, String company) async {
    if (kDebugMode) {
      print(nik);
    }
    final response = await get(
        'https://lp.abpjobsite.com/api/v1/presensi/lastAbsen?nik=$nik&company=$company');
    return LastAbsenModels.fromJson(response.body);
  }
}

class AbsensiProviders {
  Future<LastAbsenModels?> getLastAbsen(String nik, String company) async {
    var api = await http.get(Uri.parse(
        "https://lp.abpjobsite.com/api/v1/presensi/lastAbsen?nik=$nik&company=$company"));
    var jsonObject = json.decode(api.body);
    return LastAbsenModels.fromJson(jsonObject);
  }
}
