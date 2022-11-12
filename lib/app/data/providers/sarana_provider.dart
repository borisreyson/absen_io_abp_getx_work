import 'package:face_id_plus/app/data/models/check_p2h.dart';
import 'package:face_id_plus/app/data/models/detail_sarana_model.dart';
import 'package:face_id_plus/app/data/models/karyawan_model.dart';
import 'package:face_id_plus/app/data/models/listSaranaHeader.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class SaranaProvider {
  Future<ListSaranaHeader> getSarana(int? hal) async {
    var uri =
        Uri.parse("https://lp.abpjobsite.com/api/v1/p2h/list/sarana?page=$hal");
    var api = await http.get(uri);
    var jsonRes = json.decode(api.body);
    return ListSaranaHeader.fromJson(jsonRes);
  }

  Future<DetailSaranaModel> getDetailSarana(no) async {
    var uri =
        Uri.parse("https://lp.abpjobsite.com/api/v1/p2h/detail/sarana?no=$no");
    var api = await http.get(uri);
    var jsonRes = json.decode(api.body);
    return DetailSaranaModel.fromJson(jsonRes);
  }

  Future<KaryawanModel> getKaryawan(String? nik) async {
    var uri =
        Uri.parse("https://lp.abpjobsite.com/api/v1/p2h/get/karyawan?nik=$nik");
    var api = await http.get(uri);
    var jsonRes = json.decode(api.body);
    return KaryawanModel.fromJson(jsonRes);
  }

  Future<CheckP2HModels> checkP2h(p2hId) async {
    var uri = Uri.parse(
        "https://lp.abpjobsite.com/api/v1/p2h/check/data/p2h?p2hId=$p2hId");
    var api = await http.get(uri);
    var jsonRes = json.decode(api.body);
    return CheckP2HModels.fromJson(jsonRes);
  }

  Future<ResultSarana> rubahSarana(UpdateSarana body) async {
    var apiResult = await http.post(
        Uri.parse("https://lp.abpjobsite.com/api/v1/p2h/update/sarana/header"),
        body: body.toJson());
    var jsonObject = json.decode(apiResult.body);
    return ResultSarana.fromJson(jsonObject);
  }

  Future<ResultSarana> tambahSarana(body) async {
    var apiResult = await http.post(
        Uri.parse("https://lp.abpjobsite.com/api/v1/p2h/tambah/sarana"),
        body: body.toJson());
    var jsonObject = json.decode(apiResult.body);
    return ResultSarana.fromJson(jsonObject);
  }

  Future<ResultSarana> endDisSarana(String? no, String? flag) async {
    var apiResult = await http.post(
        Uri.parse("https://lp.abpjobsite.com/api/v1/p2h/status/sarana"),
        body: {"no": no, "flag": flag});
    var jsonObject = json.decode(apiResult.body);
    return ResultSarana.fromJson(jsonObject);
  }
}

class ResultSarana {
  bool? success;
  ResultSarana({this.success});
  factory ResultSarana.fromJson(Map<String, dynamic> data) {
    return ResultSarana(success: data['success']);
  }
}

class UpdateSarana {
  String? field;
  String? data;
  String? no;
  UpdateSarana({this.field, this.data, this.no});
  factory UpdateSarana.fromJson(Map<String, dynamic> json) {
    return UpdateSarana(
        field: json['field'], data: json['data'], no: json['no']);
  }
  Map<String, dynamic> toJson() {
    var dataBody = <String, dynamic>{};
    dataBody["field"] = field;
    dataBody["data"] = data;
    dataBody["no"] = no;
    return dataBody;
  }
}
