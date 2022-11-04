import 'dart:convert';
import 'dart:io';
import 'package:face_id_plus/app/data/models/p2h_sarana_mode.dart';
import 'package:face_id_plus/app/data/models/p2h_sarana_models.dart';
import 'package:face_id_plus/app/data/models/p2h_temuan_models.dart';
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;
import '../models/master_pemeriksaan_model.dart';
import 'package:http/http.dart' as http;
import 'package:random_string/random_string.dart';

import '../models/p2h_pemeriksaan.dart';

class P2hProvider {
  Future<PemeriksaanModel> getPemeriksaan(int? hal) async {
    var uri = Uri.parse(
        "https://lp.abpjobsite.com/api/v1/p2h/master/pemeriksaan?page=$hal");
    var api = await http.get(uri);
    var jsonRes = json.decode(api.body);
    return PemeriksaanModel.fromJson(jsonRes);
  }

  Future<ResultP2H> tambahDaftarPemeriksaan(MasterPemeriksaan body) async {
    var apiResult = await http.post(
        Uri.parse("https://lp.abpjobsite.com/api/v1/p2h/master/pemeriksaan"),
        body: body.toJson());
    var jsonObject = json.decode(apiResult.body);
    return ResultP2H.fromJson(jsonObject);
  }

  Future<ResultP2H> enableDisable(
      String? idPemeriksaan, String? flagPemeriksaan) async {
    var apiResult = await http.post(
        Uri.parse(
            "https://lp.abpjobsite.com/api/v1/p2h/master/pemeriksaan/enableDisable"),
        body: {
          "idPemeriksaan": idPemeriksaan,
          "flagPemeriksaan": flagPemeriksaan
        });
    var jsonObject = json.decode(apiResult.body);
    return ResultP2H.fromJson(jsonObject);
  }

  Future<ResultP2H> update(String? idPemeriksaan, String? diperiksa) async {
    var apiResult = await http.post(
        Uri.parse(
            "https://lp.abpjobsite.com/api/v1/p2h/master/pemeriksaan/update"),
        body: {"idPemeriksaan": idPemeriksaan, "diperiksa": diperiksa});
    var jsonObject = json.decode(apiResult.body);
    return ResultP2H.fromJson(jsonObject);
  }

  Future<PemeriksaanP2h> getPemeriksaanAll() async {
    var uri = Uri.parse(
        "https://lp.abpjobsite.com/api/v1/p2h/master/pemeriksaan/all");
    var api = await http.get(uri);
    var jsonRes = json.decode(api.body);
    return PemeriksaanP2h.fromJson(jsonRes);
  }

  Future<ResultP2H?> postFileP2h(File file, username,
      {String? idDevice}) async {
    Map<String, dynamic>? res;

    DateTime dt = DateTime.now();

    String filename =
        "p2h_${idDevice}_${"${dt.hour}".padLeft(2, "0")}${"${dt.minute}".padLeft(2, "0")}${"${dt.second}".padLeft(2, "0")}_${username}_${randomAlphaNumeric(16)}${p.extension(file.path)}";

    Uri uri =
        Uri.parse("https://lp.abpjobsite.com/api/v1/p2h/upload/file/temuan");

    var request = http.MultipartRequest("POST", uri);

    request.files.add(http.MultipartFile.fromBytes(
        'fileP2h', await file.readAsBytes(),
        filename: filename));

    request.fields['username'] = "$username";

    var response = await request.send();
    await for (String s in response.stream.transform(utf8.decoder)) {
      if (kDebugMode) {
        print("response $s");
      }
      res = jsonDecode(s);
    }
    return ResultP2H.fromJson(res!);
  }

  Future<ResultP2H> postDataP2h(P2HDataModels p2hModels) async {
    var apiResult = await http.post(
        Uri.parse("https://lp.abpjobsite.com/api/v1/p2h/simpan/data"),
        body: json.encode(p2hModels.toJson()),
        headers: {'Content-type': 'application/json'});
    var jsonObject = json.decode(apiResult.body);
    return ResultP2H.fromJson(jsonObject);
  }

  Future<SaranaP2h> getAllP2hSarana(int? hal, String? userIn) async {
    var uri = Uri.parse(
        "https://lp.abpjobsite.com/api/v1/p2h/all/sarana?page=$hal&userIn=$userIn");
    var api = await http.get(uri);
    var jsonRes = json.decode(api.body);
    return SaranaP2h.fromJson(jsonRes);
  }

  Future<SaranaP2h> getAllP2hSarpras(int? hal) async {
    var uri =
        Uri.parse("https://lp.abpjobsite.com/api/v1/p2h/all/sarana?page=$hal");
    var api = await http.get(uri);
    var jsonRes = json.decode(api.body);
    return SaranaP2h.fromJson(jsonRes);
  }

  Future<SaranaP2h> getAllP2hSaranaId(
      int? hal, String? saranaId, String? userIn) async {
    var uri = Uri.parse(
        "https://lp.abpjobsite.com/api/v1/p2h/sarpras/sarana?page=$hal&saranaId=$saranaId&userIn=$userIn");
    var api = await http.get(uri);
    var jsonRes = json.decode(api.body);
    return SaranaP2h.fromJson(jsonRes);
  }

  Future<SaranaP2h> getAllP2hSarprasId(int? hal, String? saranaId) async {
    var uri = Uri.parse(
        "https://lp.abpjobsite.com/api/v1/p2h/sarpras/sarana?page=$hal&saranaId=$saranaId");
    var api = await http.get(uri);
    var jsonRes = json.decode(api.body);
    return SaranaP2h.fromJson(jsonRes);
  }

  Future<P2hTemuanModel> getP2hTemuan(uniqid) async {
    var uri = Uri.parse(
        "https://lp.abpjobsite.com/api/v1/p2h/get/temuan?uniqid=$uniqid");
    var api = await http.get(uri);
    var jsonRes = json.decode(api.body);
    return P2hTemuanModel.fromJson(jsonRes);
  }

  Future<P2hPemeriksaanModel> getPemeriksaanUnit(uniqid) async {
    var uri = Uri.parse(
        "https://lp.abpjobsite.com/api/v1/p2h/get/pemeriksaan?uniqid=$uniqid");
    var api = await http.get(uri);
    var jsonRes = json.decode(api.body);
    return P2hPemeriksaanModel.fromJson(jsonRes);
  }

  Future<ResultP2H> updateP2hPost(UpdateP2hHmKm p2hModels) async {
    var apiResult = await http.post(
        Uri.parse("https://lp.abpjobsite.com/api/v1/p2h/update/hmkm/akhir"),
        body: p2hModels.toJson());
    var jsonObject = json.decode(apiResult.body);
    return ResultP2H.fromJson(jsonObject);
  }
}

class ResultP2H {
  bool? success;
  String? fileName;
  ResultP2H({this.success, this.fileName});
  factory ResultP2H.fromJson(Map<String, dynamic> data) {
    return ResultP2H(success: data['success'], fileName: data['fileName']);
  }
}

class TestResult {
  String? saranaHeader;
  TestResult({this.saranaHeader});
  factory TestResult.fromJson(Map<String, dynamic> json) {
    return TestResult(saranaHeader: json['saranaHeader']);
  }
}
