import 'dart:convert';
import 'dart:io';
import 'package:face_id_plus/app/modules/hge/cuti/models/form_cuti_model.dart';
import 'package:face_id_plus/app/modules/hge/cuti/models/list_cuti_model.dart';
import 'package:face_id_plus/app/modules/hge/cuti/models/maskapai_model.dart';
import 'package:face_id_plus/app/modules/hge/cuti/models/roster_cuti_karyawan.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ProviderCuti {
  Future<RosterCutiKaryawan> rosterCutiKaryawan({String? nik, page}) async {
    String apiUrl =
        "https://lp.abpjobsite.com/api/v1/cuti/roster/karyawan?nikCuti=$nik&page=$page";
    var apiResult = await http.get(Uri.parse(apiUrl));
    var jsonObject = json.decode(apiResult.body);
    return RosterCutiKaryawan.fromJson(jsonObject);
  }

  Future<MaskapaiResponse> maskapaiAdd(MaskapaiPost body) async {
    String apiUrl = "https://lp.abpjobsite.com/api/v1/cuti/maskapai";
    var apiResult = await http.post(
      Uri.parse(apiUrl),
      body: json.encode(body.toJson()),
      headers: {"Content-Type": "application/json"},
    );
    var jsonObject = json.decode(apiResult.body);
    return MaskapaiResponse.fromJson(jsonObject);
  }

  Future<MaskapaiResponse> maskapaiUpdate(MaskapaiPost body) async {
    String apiUrl = "https://lp.abpjobsite.com/api/v1/cuti/maskapai/update";
    var apiResult = await http.post(
      Uri.parse(apiUrl),
      body: json.encode(body.toJson()),
      headers: {"Content-Type": "application/json"},
    );
    var jsonObject = json.decode(apiResult.body);
    return MaskapaiResponse.fromJson(jsonObject);
  }

  Future<MaskapaiModelGet> maskapaiGet({page}) async {
    String apiUrl = "https://lp.abpjobsite.com/api/v1/cuti/maskapai?page=$page";
    var apiResult = await http.get(Uri.parse(apiUrl));
    var jsonObject = json.decode(apiResult.body);
    return MaskapaiModelGet.fromJson(jsonObject);
  }

  Future<ResultCuti> cutiPostApi(CutiPost body) async {
    String apiUrl = "https://lp.abpjobsite.com/api/v1/cuti/form/create";
    var apiResult = await http.post(
      Uri.parse(apiUrl),
      body: json.encode(body.toJson()),
      headers: {"Content-Type": "application/json"},
    );
    var jsonObject = json.decode(apiResult.body);
    return ResultCuti.fromJson(jsonObject);
  }

  Future<ListCutiOnlineModels> getCutiUser({nik, page}) async {
    String apiUrl =
        "https://lp.abpjobsite.com/api/v1/cuti/get/user?nikKaryawan=$nik&page=$page";
    var apiResult = await http.get(Uri.parse(apiUrl));
    var jsonObject = json.decode(apiResult.body);
    return ListCutiOnlineModels.fromJson(jsonObject);
  }

  Future<ListCutiOnlineModels> getCutiAtasan({nik, page}) async {
    String apiUrl =
        "https://lp.abpjobsite.com/api/v1/cuti/get/atasan?nikAtasan=$nik&page=$page";
    var apiResult = await http.get(Uri.parse(apiUrl));
    var jsonObject = json.decode(apiResult.body);
    return ListCutiOnlineModels.fromJson(jsonObject);
  }

  Future<ResultCuti> setujuiAtasan(String username, String idCutiOnline) async {
    String apiUrl = "https://lp.abpjobsite.com/api/v1/cuti/get/atasan";
    var apiResult = await http.post(
      Uri.parse(apiUrl),
      body: {"username": username, "idCutiOnline": idCutiOnline},
    );
    var jsonObject = json.decode(apiResult.body);
    return ResultCuti.fromJson(jsonObject);
  }

  Future<ResultCuti> batalkanCutiOnline(
      String username, String idCutiOnline, String keteranganBatal) async {
    String apiUrl = "https://lp.abpjobsite.com/api/v1/cuti/batalkan";
    var apiResult = await http.post(
      Uri.parse(apiUrl),
      body: {
        "username": username,
        "_method": "PUT",
        "idCutiOnline": idCutiOnline,
        "keteranganBatal": keteranganBatal
      },
    );
    var jsonObject = json.decode(apiResult.body);
    return ResultCuti.fromJson(jsonObject);
  }

  Future<ResultCuti> batalkanPerpanjanganCutiOnline(
      String username, String idCutiOnline, String keteranganBatal) async {
    String apiUrl =
        "https://lp.abpjobsite.com/api/v1/cuti/batalkan/perpanjangan";
    var apiResult = await http.post(
      Uri.parse(apiUrl),
      body: {
        "username": username,
        "_method": "PUT",
        "idCutiOnline": idCutiOnline,
        "keteranganBatal": keteranganBatal
      },
    );
    var jsonObject = json.decode(apiResult.body);
    return ResultCuti.fromJson(jsonObject);
  }

  Future<ResultCuti> ubahTanggalCuti(
    String username,
    String idCutiOnline,
    String dari,
    String sampai,
    String? tglMulaiCutiOnline,
    String? tglSelesaiCutiOnline,
    String? jenisCuti,
  ) async {
    String apiUrl = "https://lp.abpjobsite.com/api/v1/cuti/ubah/tanggal";
    var apiResult = await http.post(
      Uri.parse(apiUrl),
      body: {
        "username": username,
        "_method": "PUT",
        "idCutiOnline": idCutiOnline,
        "dari": dari,
        "sampai": sampai,
        "tglMulaiCutiOnline": tglMulaiCutiOnline,
        "tglSelesaiCutiOnline": tglSelesaiCutiOnline,
      },
    );
    var jsonObject = json.decode(apiResult.body);
    return ResultCuti.fromJson(jsonObject);
  }
  Future<ResultCuti> ubahTanggalPerpanjangan(
    String username,
    String idCutiOnline,
    String dari,
    String sampai,
    String? tglMulaiCutiOnline,
    String? tglSelesaiCutiOnline,
    String? jenisCuti,
  ) async {
    String apiUrl = "https://lp.abpjobsite.com/api/v1/cuti/ubah/tanggal/perpanjangan";
    var apiResult = await http.post(
      Uri.parse(apiUrl),
      body: {
        "username": username,
        "_method": "PUT",
        "idCutiOnline": idCutiOnline,
        "dari": dari,
        "sampai": sampai,
        "tglMulaiCutiOnline": tglMulaiCutiOnline,
        "tglSelesaiCutiOnline": tglSelesaiCutiOnline,
      },
    );
    var jsonObject = json.decode(apiResult.body);
    return ResultCuti.fromJson(jsonObject);
  }

  Future<ListCutiOnlineModels> getCutiDeptHead({department, page}) async {
    String apiUrl =
        "https://lp.abpjobsite.com/api/v1/cuti/get/dept/head?department=$department&page=$page";
    var apiResult = await http.get(Uri.parse(apiUrl));
    var jsonObject = json.decode(apiResult.body);
    return ListCutiOnlineModels.fromJson(jsonObject);
  }

  Future<ResultCuti> setujuiDeptHead(
      String username, String idCutiOnline) async {
    String apiUrl = "https://lp.abpjobsite.com/api/v1/cuti/get/dept/head";
    var apiResult = await http.post(
      Uri.parse(apiUrl),
      body: {"username": username, "idCutiOnline": idCutiOnline},
    );
    var jsonObject = json.decode(apiResult.body);
    return ResultCuti.fromJson(jsonObject);
  }

  Future<ListCutiOnlineModels> getCutiKTT({page}) async {
    String apiUrl = "https://lp.abpjobsite.com/api/v1/cuti/get/ktt?page=$page";
    var apiResult = await http.get(Uri.parse(apiUrl));
    var jsonObject = json.decode(apiResult.body);
    return ListCutiOnlineModels.fromJson(jsonObject);
  }

  Future<ResultCuti> setujuiKTT(String username, String idCutiOnline) async {
    String apiUrl = "https://lp.abpjobsite.com/api/v1/cuti/get/ktt";
    var apiResult = await http.post(
      Uri.parse(apiUrl),
      body: {"username": username, "idCutiOnline": idCutiOnline},
    );
    var jsonObject = json.decode(apiResult.body);
    return ResultCuti.fromJson(jsonObject);
  }

  Future<ListCutiOnlineModels> getCutiHC({section, page}) async {
    String apiUrl =
        "https://lp.abpjobsite.com/api/v1/cuti/get/hc?section=$section&page=$page";
    var apiResult = await http.get(Uri.parse(apiUrl));
    var jsonObject = json.decode(apiResult.body);
    return ListCutiOnlineModels.fromJson(jsonObject);
  }

  Future<ResultCuti> setujuiHC(String username, String idCutiOnline) async {
    String apiUrl = "https://lp.abpjobsite.com/api/v1/cuti/get/hc";
    var apiResult = await http.post(
      Uri.parse(apiUrl),
      body: {"username": username, "idCutiOnline": idCutiOnline},
    );
    var jsonObject = json.decode(apiResult.body);
    return ResultCuti.fromJson(jsonObject);
  }

  Future<ResultCuti> batalkanHC(
    String username,
  ) async {
    String apiUrl = "https://lp.abpjobsite.com/api/v1/cuti/form/create";
    var apiResult = await http.post(
      Uri.parse(apiUrl),
      body: {"username": username},
    );
    var jsonObject = json.decode(apiResult.body);
    return ResultCuti.fromJson(jsonObject);
  }

  Future<TiketCutiModels> getCutiTiket({idCutiOnline}) async {
    String apiUrl =
        "https://lp.abpjobsite.com/api/v1/cuti/get/tiket?idCutiOnline=$idCutiOnline";
    var apiResult = await http.get(Uri.parse(apiUrl));
    var jsonObject = json.decode(apiResult.body);
    return TiketCutiModels.fromJson(jsonObject);
  }

  Future<File> getPdfCuti(String idCutiOnline, String fileName) async {
    try {
      var url = Uri.parse(
          "https://abpjobsite.com/hc/cuti/view/pdf?idCutiOnline=$idCutiOnline");
      // var url = Uri.parse(
      //     "https://abpjobsite.com/hc/cuti/view/pdf?idCutiOnline=6356380843c80");
      var apiWeb = await http.get(url);
      var bytes = apiWeb.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$fileName.pdf");
      File urlFile = await file.writeAsBytes(bytes);
      print("pdf = ${file} ${urlFile}");
      return urlFile;
    } catch (e) {
      throw Exception("Error opening url file");
    }
  }
}
