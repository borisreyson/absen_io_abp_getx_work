import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:face_id_plus/app/data/models/data_karayawan.dart' as karyawan;
import 'package:face_id_plus/app/data/models/device_update_model.dart';
import 'package:face_id_plus/app/data/models/lampiran_rkb.dart';
import 'package:face_id_plus/app/data/models/last_absen_model.dart';
import 'package:face_id_plus/app/data/models/pesan_models.dart';
import 'package:face_id_plus/app/data/models/rkb_detail_models.dart';
import 'package:face_id_plus/app/data/models/rkb_models.dart' as rkb;
import 'package:face_id_plus/app/data/models/sarana_models.dart';
import 'package:face_id_plus/app/data/models/sarpras_detail.dart';
import 'package:face_id_plus/app/data/models/sarpras_list.dart' as sarpras;
import 'package:face_id_plus/app/data/models/sarpras_penumpang.dart';
import 'package:face_id_plus/app/modules/home/buletin_model.dart' as buletin;
import 'package:flutter/foundation.dart';
import 'package:get/get_connect.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import '../models/all_hazard_model.dart';
import '../models/approve_models.dart';
import '../models/counter_hazard.dart';
import '../models/data_hazard.dart';
import '../models/detail_keparahan_model.dart';
import '../models/detail_pengendalian_model.dart';
import '../models/face_model.dart';
import 'package:http/http.dart' as http;
import '../models/hazard_model.dart';
import '../models/hazard_post.dart';
import '../models/hazard_user.dart';
import '../models/kemungkinan_model.dart';
import '../models/keparahan_model.dart';
import '../models/list_absen.dart';
import '../models/login_model.dart';
import '../models/lokasi_model.dart';
import '../models/metrik_resiko_model.dart';
import '../models/pengendalian.dart';
import '../models/perusahaan_model.dart';
import '../models/rosterkerja.dart';
import '../models/berita.dart' as berita;
import '../models/user_profile.dart';
import '../models/users_model.dart';
import '../utils/constants.dart';

class Provider extends GetConnect {
  Future<AbsenList> apiListAbsenUser({String? nik, page}) async {
    String apiUrl =
        "https://lp.abpjobsite.com/api/v1/presensi/get/list/user?nik=$nik&page=$page";
    var apiResult = await http.get(Uri.parse(apiUrl));
    var jsonObject = json.decode(apiResult.body);
    var absenList = AbsenList.fromJson(jsonObject);
    absenList.listAbsen?.data?.forEach((element) {});
    return absenList;
  }

  Future<FaceModel?> loginApiFace(LoginABP loginABP) async {
    String apiUrl = "https://lp.abpjobsite.com/api/login/face";
    var apiResult = await http.post(Uri.parse(apiUrl), body: loginABP.toJson());
    var jsonObject = json.decode(apiResult.body);
    return FaceModel.fromJson(jsonObject);
  }

  Future<Response> getCekLogin(String? nik) async {
    final response =
        await get('https://lp.abpjobsite.com/api/v1/cek/login?nik=$nik');
    return response;
  }

  Future<Response> login(LoginABP loginABP) async {
    return await post(
        "https://lp.abpjobsite.com/api/v1/login", loginABP.toJson());
  }

  Future<AuthModel?> loginAbpPost(LoginABP loginABP) async {
    String apiUrl = "https://lp.abpjobsite.com/api/v1/login";
    var apiResult = await http.post(Uri.parse(apiUrl), body: loginABP.toJson());
    var jsonObject = json.decode(apiResult.body);
    return AuthModel.fromJson(jsonObject);
  }

  Future<AbsenList> listAbsensiUser({String? nik, String? status, page}) async {
    String apiUrl =
        "https://abpjobsite.com/api/android/get/list/absen?nik=$nik&status=$status&page=$page";
    var apiResult = await http.get(Uri.parse(apiUrl));
    var jsonObject = json.decode(apiResult.body);
    var absenList = AbsenList.fromJson(jsonObject);
    return absenList;
  }

  Future<ApiRoster> getRoster(String? nik, String bulan, String tahun) async {
    var url = Uri.parse(
        "https://lp.abpjobsite.com/api/roster/kerja/karyawan?nik=$nik&tahun=$tahun&bulan=$bulan");
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return ApiRoster.fromJson(objekJson);
  }

  Future<rkb.RkbModels> getRkbUser(
      String? username, String page, String status) async {
    var url = Uri.parse(
        "https://lp.abpjobsite.com/api/v1/rkb/user?username=$username&page=$page&status=$status");
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return rkb.RkbModels.fromJson(objekJson);
  }

  Future<rkb.RkbModels> getRkbDept(
      String? idDept, String page, String status) async {
    var url = Uri.parse(
        "https://lp.abpjobsite.com/api/v1/rkb/dept?dept=$idDept&page=$page&status=$status");
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return rkb.RkbModels.fromJson(objekJson);
  }

  Future<rkb.RkbModels> getRkbKtt(String page, String status) async {
    var url = Uri.parse(
        "https://lp.abpjobsite.com/api/v1/rkb/ktt?page=$page&status=$status");
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return rkb.RkbModels.fromJson(objekJson);
  }

  Future<RkbDetailModels> getRkbDetail(String? idHeader) async {
    var url = Uri.parse(
        "https://lp.abpjobsite.com/api/v1/rkb/detail?idHeader=$idHeader");
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return RkbDetailModels.fromJson(objekJson);
  }

  Future<ApproveModels> approveRkbKabag(ApprovePost body) async {
    String apiUrl = "https://lp.abpjobsite.com/api/v1/rkb/approve/kabag";
    var apiResult = await http.post(Uri.parse(apiUrl), body: body.toJson());
    var jsonObject = json.decode(apiResult.body);
    return ApproveModels.fromJson(jsonObject);
  }

  Future<ApproveModels> approveRkbSection(ApprovePost body) async {
    String apiUrl = "https://lp.abpjobsite.com/api/v1/rkb/approve/section";
    var apiResult = await http.post(Uri.parse(apiUrl), body: body.toJson());
    var jsonObject = json.decode(apiResult.body);
    return ApproveModels.fromJson(jsonObject);
  }

  Future<ApproveModels> approveRkbKTT(ApprovePost body) async {
    String apiUrl = "https://lp.abpjobsite.com/api/v1/rkb/approve/ktt";
    var apiResult = await http.post(Uri.parse(apiUrl), body: body.toJson());
    var jsonObject = json.decode(apiResult.body);
    return ApproveModels.fromJson(jsonObject);
  }

  Future<ApproveModels> cancelRKB(CancelRKB body) async {
    String apiUrl = "https://lp.abpjobsite.com/api/v1/rkb/cancel";
    var apiResult = await http.post(Uri.parse(apiUrl), body: body.toJson());
    var jsonObject = json.decode(apiResult.body);
    return ApproveModels.fromJson(jsonObject);
  }

  Future<ApproveModels> tanyakanRKB(PesanModels body) async {
    String apiUrl = "https://lp.abpjobsite.com/api/v1/rkb/tanyakan";
    var apiResult = await http.post(Uri.parse(apiUrl), body: body.toJson());
    var jsonObject = json.decode(apiResult.body);
    return ApproveModels.fromJson(jsonObject);
  }

  Future<File> getPdfRkb(String noRkb, String fileName) async {
    try {
      var url = Uri.parse(
          "https://lp.abpjobsite.com/api/v1/rkb/print/pdf?fName=$noRkb");
      // var url = Uri.parse(
      //     "https://abpjobsite.com/hc/cuti/view/pdf?idCutiOnline=6356380843c80");

      var apiWeb = await http.get(url);
      var bytes = apiWeb.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$fileName.pdf");
      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e) {
      throw Exception("Error opening url file");
    }
  }

  Future<File> getPdfSarpras(String noSarpras, String fileName) async {
    try {
      var url = Uri.parse(
          "https://lp.abpjobsite.com/api/v1/sarpras/pdf/open/$noSarpras");
      var apiWeb = await http.get(url);
      var bytes = apiWeb.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$fileName.pdf");
      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e) {
      throw Exception("Error opening url file");
    }
  }

  Future<LampiranRKBModels> getLampiranRKB(String? noRkb) async {
    var url =
        Uri.parse("https://lp.abpjobsite.com/api/v1/rkb/lampiran?noRKB=$noRkb");
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return LampiranRKBModels.fromJson(objekJson);
  }

  Future<sarpras.SarprasListModels> getSarprasIT(String? page) async {
    var url =
        Uri.parse("https://lp.abpjobsite.com/api/v1/sarpras/it?page=$page");
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return sarpras.SarprasListModels.fromJson(objekJson);
  }

  Future<sarpras.SarprasListModels> getSarprasKabagSect(
      String? page, String? dept) async {
    var url = Uri.parse(
        "https://lp.abpjobsite.com/api/v1/sarpras/kabag?dept=$dept&page=$page");
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return sarpras.SarprasListModels.fromJson(objekJson);
  }

  Future<sarpras.SarprasListModels> getSarprasUser(
      String? page, String? nik) async {
    var url = Uri.parse(
        "https://lp.abpjobsite.com/api/v1/sarpras/user?nik=$nik&page=$page");
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return sarpras.SarprasListModels.fromJson(objekJson);
  }

  Future<SarprasDetail> getSarprasDetail(String? noidOut, String? page) async {
    var url = Uri.parse(
        "https://lp.abpjobsite.com/api/v1/sarpras/detail?page=$page&noidOut=$noidOut");
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return SarprasDetail.fromJson(objekJson);
  }

  Future<SarprasPenumpang> getSarprasPenumpang(String? nik) async {
    var url = Uri.parse(
        "https://lp.abpjobsite.com/api/v1/sarpras/penumpang?nik=$nik");
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return SarprasPenumpang.fromJson(objekJson);
  }

  Future<SaranaModels> getSarana(String? cari) async {
    var url =
        Uri.parse("https://lp.abpjobsite.com/api/v1/sarpras/sarana?cari=$cari");
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return SaranaModels.fromJson(objekJson);
  }

  Future<ResultPostSarana> postSarana(body) async {
    var url = Uri.parse("https://lp.abpjobsite.com/api/v1/sarpras/sarana");
    var apiWeb = await http.post(
      url,
      body: json.encode(body.toJson()),
      headers: {"Content-Type": "application/json"},
    );
    var objekJson = json.decode(apiWeb.body);
    return ResultPostSarana.fromJson(objekJson);
  }

  Future<ResultPostSarana> approveSarana(body) async {
    var url = Uri.parse("https://lp.abpjobsite.com/api/v1/sarpras/approve");
    var apiWeb = await http.post(
      url,
      body: json.encode(body.toJson()),
      headers: {"Content-Type": "application/json"},
    );
    var objekJson = json.decode(apiWeb.body);
    return ResultPostSarana.fromJson(objekJson);
  }

  Future<ResultPostSarana> cancelSarana(body) async {
    var url = Uri.parse("https://lp.abpjobsite.com/api/v1/sarpras/cancel");
    var apiWeb = await http.post(
      url,
      body: json.encode(body.toJson()),
      headers: {"Content-Type": "application/json"},
    );
    var objekJson = json.decode(apiWeb.body);
    return ResultPostSarana.fromJson(objekJson);
  }

  Future<ResultPostFoto?> postFotoProfile(
      PostFotoProfile data, idDevice) async {
    Map<String, dynamic>? res;

    DateTime dt = DateTime.now();

    String filename =
        "${"${dt.hour}".padLeft(2, "0")}${"${dt.minute}".padLeft(2, "0")}${"${dt.second}".padLeft(2, "0")}_${idDevice}_${data.username}.jpg";

    Uri uri = Uri.parse("https://lp.abpjobsite.com/api/v1/hazard/update/foto");

    var request = http.MultipartRequest("POST", uri);

    request.files.add(http.MultipartFile.fromBytes(
        'fotoProfile', await data.fotoProfile!.readAsBytes(),
        filename: filename));

    request.fields['username'] = "${data.username}";
    request.fields['idDevice'] = "$idDevice";

    var response = await request.send();
    await for (String s in response.stream.transform(utf8.decoder)) {
      if (kDebugMode) {
        print("response $s");
      }
      res = jsonDecode(s);
    }
    return ResultPostFoto.fromJson(res!);
  }

  Future<karyawan.ListKaryawan> getKaryawan(int? hal, {String? cari}) async {
    Uri? url;
    if (cari != null) {
      url = Uri.parse(
          "https://lp.abpjobsite.com/api/v1/data/karyawan?page=$hal&cari=$cari");
    } else {
      url =
          Uri.parse("https://lp.abpjobsite.com/api/v1/data/karyawan?page=$hal");
    }

    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return karyawan.ListKaryawan.fromJson(objekJson);
  }

  Future<ResultPostSarana> updateSarpras(UpdateSecurity body) async {
    var url =
        Uri.parse("https://lp.abpjobsite.com/api/v1/sarpras/update/security");
    var apiWeb = await http.post(
      url,
      body: json.encode(body.toJson()),
      headers: {"Content-Type": "application/json"},
    );
    var objekJson = json.decode(apiWeb.body);
    return ResultPostSarana.fromJson(objekJson);
  }

  Future<Presensi> apiAbsenTigaHari(String? nik) async {
    String apiUrl =
        "https://lp.abpjobsite.com/api/v1/presensi/get/list?nik=$nik";
    var apiResult = await http.get(Uri.parse(apiUrl));
    var jsonObject = json.decode(apiResult.body);
    return Presensi.fromJson(jsonObject);
  }
}
//Provider

//AllHazardProvider
class AllHazardProvider {
  Future<AllHazard?> getAllHazard(
      int disetujui, int page, String dari, String sampai) async {
    var api = await http.get(Uri.parse(
        "${Constants.baseUrl}api/v1/hazard/safety?user_valid=$disetujui&page=$page&dari=$dari&sampai=$sampai"));

    var jsonObject = json.decode(api.body);

    var decoJson = AllHazard.fromJson(jsonObject);
    return decoJson;
  }
}

class KemungkinanProvider {
  Future<KemungkinanResiko?> getKemungkinan() async {
    var api = await http
        .get(Uri.parse("${Constants.mainUrl}hse/admin/resiko/kemungkinan"));

    var jsonObject = json.decode(api.body);
    var decoJson = KemungkinanResiko.fromJson(jsonObject);
    return decoJson;
  }
}

class KeparahanProvider {
  Future<KeparahanResiko?> getKeparahan() async {
    var api = await http
        .get(Uri.parse("${Constants.mainUrl}hse/admin/resiko/keparahan"));
    var jsonObject = json.decode(api.body);
    var decoJson = KeparahanResiko.fromJson(jsonObject);
    return decoJson;
  }
}

class MertikResikoProvider {
  Future<MetrikModel?> getMetrik() async {
    var api = await http
        .get(Uri.parse("${Constants.mainUrl}android/api/matrik/resiko"));
    var jsonObject = json.decode(api.body);
    var decoJson = MetrikModel.fromJson(jsonObject);
    return decoJson;
  }
}

class PerusahaanProvider {
  Future<PerusahaanModel?> getPerusahaan() async {
    var api = await http
        .get(Uri.parse("${Constants.mainUrl}android/api/get/perusahaan"));
    var jsonObject = json.decode(api.body);
    var decoJson = PerusahaanModel.fromJson(jsonObject);
    return decoJson;
  }
}

class LokasiProvider {
  Future<LokasiModel?> getLokasi() async {
    var api =
        await http.get(Uri.parse("${Constants.mainUrl}android/api/lokasi/get"));
    var jsonObject = json.decode(api.body);
    var decoJson = LokasiModel.fromJson(jsonObject);
    return decoJson;
  }
}

class DetKeparahanProvider {
  Future<DetailKeparahanModel?> getDetKeparahan() async {
    var api = await http.get(
        Uri.parse("${Constants.mainUrl}hse/admin/resiko/keparahan/detail"));
    var jsonObject = json.decode(api.body);
    var decoJson = DetailKeparahanModel.fromJson(jsonObject);
    return decoJson;
  }
}

class PengendalianProvider {
  Future<PengendalianModel?> getPengendalian() async {
    var api = await http
        .get(Uri.parse("${Constants.mainUrl}hse/admin/hiraiki/pengendalian"));
    var jsonObject = json.decode(api.body);
    var decoJson = PengendalianModel.fromJson(jsonObject);
    return decoJson;
  }

  getDetKeparahan() {}
}

class DetPengendalianProvider {
  Future<DetPengendalianModel?> getDetPengendalian() async {
    var api = await http.get(
        Uri.parse("${Constants.mainUrl}hse/admin/hiraiki/pengendalian/detail"));
    var jsonObject = json.decode(api.body);
    var decoJson = DetPengendalianModel.fromJson(jsonObject);
    return decoJson;
  }
}

class UsersProvider {
  Future<UsersModel?> getUsers() async {
    var api = await http
        .get(Uri.parse("${Constants.mainUrl}android/api/list/users/all"));
    var jsonObject = json.decode(api.body);
    var decoJson = UsersModel.fromJson(jsonObject);
    return decoJson;
  }

  Future<UserProfileModel?> getUsersProfile(username) async {
    var api = await http.get(Uri.parse(
        "${Constants.mainUrl}android/api/get/user?username=$username"));
    var jsonObject = json.decode(api.body);
    var decoJson = UserProfileModel.fromJson(jsonObject);
    return decoJson;
  }
}

class HazardProvider {
  String baseUrl = "https://lp.abpjobsite.com/api/v1/hazard/";

  Future<ResultHazardPost?> postHazard(HazardPostModel data, idDevice) async {
    Map<String, dynamic>? res;

    DateTime dt = DateTime.now();

    String filename =
        "${"${dt.hour}".padLeft(2, "0")}${"${dt.minute}".padLeft(2, "0")}${"${dt.second}".padLeft(2, "0")}_${idDevice}_sebelum.jpg";
    String pjFoto =
        "${"${dt.hour}".padLeft(2, "0")}${"${dt.minute}".padLeft(2, "0")}${"${dt.second}".padLeft(2, "0")}_${idDevice}_penanggung_jawab.jpg";

    Uri uri = Uri.parse("https://lp.abpjobsite.com/api/v1/hazard");

    var request = http.MultipartRequest('POST', uri);

    request.files.add(http.MultipartFile.fromBytes(
        'fileToUpload', await data.fileToUpload!.readAsBytes(),
        filename: filename));
    request.files.add(http.MultipartFile.fromBytes(
        'fileToUploadPJ', await data.fileToUploadPJ!.readAsBytes(),
        filename: pjFoto));

    request.fields['perusahaan'] = "${data.perusahaan}";
    request.fields['tgl_hazard'] = "${data.tglHazard}";
    request.fields['jam_hazard'] = "${data.jamHazard}";
    request.fields['lokasi'] = "${data.lokasi}";
    request.fields['lokasi_detail'] = "${data.lokasiDetail}";
    request.fields['deskripsi'] = "${data.deskripsi}";
    request.fields['kemungkinan'] = "${data.kemungkinan}";
    request.fields['keparahan'] = "${data.keparahan}";
    request.fields['katBahaya'] = "${data.katBahaya}";
    request.fields['pengendalian'] = "${data.pengendalian}";
    request.fields['tindakan'] = "${data.tindakan}";
    request.fields['namaPJ'] = "${data.namaPJ}";
    request.fields['nikPJ'] = "${data.nikPJ}";
    request.fields['status'] = "${data.status}";
    request.fields['tglTenggat'] = "${data.tglTenggat}";
    request.fields['user_input'] = "${data.userInput}";

    log("res ${data.fileToUpload}");
    log("res ${data.fileToUploadPJ}");
    log("res $filename");
    log("res $pjFoto");
    log("res ${data.perusahaan}");
    log("res ${data.tglHazard}");
    log("res ${data.jamHazard}");
    log("res ${data.lokasi}");
    log("res ${data.lokasiDetail}");
    log("res ${data.deskripsi}");
    log("res ${data.kemungkinan}");
    log("res ${data.keparahan}");
    log("res ${data.katBahaya}");
    log("res ${data.pengendalian}");
    log("res ${data.tindakan}");
    log("res ${data.namaPJ}");
    log("res ${data.nikPJ}");
    log("res ${data.status}");
    log("res ${data.tglTenggat}");
    log("res ${data.userInput}");

    var response = await request.send();
    log("res ${response.statusCode}");

    await for (String s in response.stream.transform(utf8.decoder)) {
      if (kDebugMode) {
        print("errorPost ${s.toString()}");
      }
      res = jsonDecode(s);
    }

    return ResultHazardPost.fromJson(
      res!,
    );
  }

  Future<ResultHazardPost?> postHazardSelesai(
      HazardPostSelesaiModel data, idDevice) async {
    Map<String, dynamic>? res;

    DateTime dt = DateTime.now();

    String filename =
        "${"${dt.hour}".padLeft(2, "0")}${"${dt.minute}".padLeft(2, "0")}${"${dt.second}".padLeft(2, "0")}_${idDevice}_sebelum.jpg";

    String pjFoto =
        "${"${dt.hour}".padLeft(2, "0")}${"${dt.minute}".padLeft(2, "0")}${"${dt.second}".padLeft(2, "0")}_${idDevice}_penanggung_jawab.jpg";

    String fNameSelesai =
        "${"${dt.hour}".padLeft(2, "0")}${"${dt.minute}".padLeft(2, "0")}${"${dt.second}".padLeft(2, "0")}_${idDevice}_selesai.jpg";

    Uri uri = Uri.parse("${baseUrl}selesai");

    var request = http.MultipartRequest("POST", uri);

    request.files.add(http.MultipartFile.fromBytes(
        'fileToUpload', await data.fileToUpload!.readAsBytes(),
        filename: filename));

    request.files.add(http.MultipartFile.fromBytes(
        'fileToUploadPJ', await data.fileToUploadPJ!.readAsBytes(),
        filename: pjFoto));

    request.files.add(http.MultipartFile.fromBytes(
        'fileToUploadSelesai', await data.fileToUploadSelesai!.readAsBytes(),
        filename: fNameSelesai));

    request.fields['perusahaan'] = "${data.perusahaan}";
    request.fields['tgl_hazard'] = "${data.tglHazard}";
    request.fields['jam_hazard'] = "${data.jamHazard}";
    request.fields['lokasi'] = "${data.lokasi}";
    request.fields['lokasi_detail'] = "${data.lokasiDetail}";
    request.fields['deskripsi'] = "${data.deskripsi}";
    request.fields['kemungkinan'] = "${data.kemungkinan}";
    request.fields['keparahan'] = "${data.keparahan}";
    request.fields['kemungkinanSesudah'] = "${data.kemungkinanSesudah}";
    request.fields['keparahanSesudah'] = "${data.keparahanSesudah}";
    request.fields['katBahaya'] = "${data.katBahaya}";
    request.fields['pengendalian'] = "${data.pengendalian}";
    request.fields['tindakan'] = "${data.tindakan}";
    request.fields['namaPJ'] = "${data.namaPJ}";
    request.fields['nikPJ'] = "${data.nikPJ}";
    request.fields['status'] = "${data.status}";
    request.fields['tglSelesai'] = "${data.tglSelesai}";
    request.fields['jamSelesai'] = "${data.jamSelesai}";
    request.fields['keteranganPJ'] = "${data.keteranganPJ}";
    request.fields['user_input'] = "${data.userInput}";

    var response = await request.send();

    await for (String s in response.stream.transform(utf8.decoder)) {
      res = jsonDecode(s);
    }
    return ResultHazardPost.fromJson(res!);
  }

  Future<ResultHazardPost?> postUpdateHazard(
      HazardUpdate data, idDevice) async {
    Map<String, dynamic>? res;

    DateTime dt = DateTime.now();

    String filename =
        "${"${dt.hour}".padLeft(2, "0")}${"${dt.minute}".padLeft(2, "0")}${"${dt.second}".padLeft(2, "0")}_${idDevice}_selesai.jpg";

    Uri uri = Uri.parse("https://lp.abpjobsite.com/api/v1/hazard/update");

    var request = http.MultipartRequest("POST", uri);

    request.files.add(http.MultipartFile.fromBytes(
        'fileToUpload', await data.fileToUpload!.readAsBytes(),
        filename: filename));

    request.fields['uid'] = "${data.uid}";
    request.fields['tgl_selesai'] = "${data.tglSelesai}";
    request.fields['jam_selesai'] = "${data.jamSelesai}";
    request.fields['idKemungkinanSesudah'] = "${data.idKemungkinanSesudah}";
    request.fields['idKeparahanSesudah'] = "${data.idKeparahanSesudah}";
    request.fields['keterangan'] = "${data.keterangan}";

    var response = await request.send();

    await for (String s in response.stream.transform(utf8.decoder)) {
      res = jsonDecode(s);
    }
    return ResultHazardPost.fromJson(res!);
  }

  Future<ResultHazardPost?> deleteHazard(uid) async {
    var api = await http.get(Uri.parse(
        "${Constants.mainUrl}android/api/hse/hazard/delete?uid=$uid"));
    var jsonObject = json.decode(api.body);
    var decoJson = ResultHazardPost.fromJson(jsonObject);
    return decoJson;
  }

  Future<HazardVerify?> verifyHazard(HazardVerify data) async {
    var api = await http.get(Uri.parse(
        "${Constants.mainUrl}android/api/hse/hazard/verify?uid=${data.uid}&option=${data.option}&username=${data.username}&keterangan=${data.keterangan}"));
    var jsonObject = json.decode(api.body);
    var decoJson = HazardVerify.fromJson(jsonObject);
    return decoJson;
  }

  Future<CounterHazard?> counterHazard(username, nik) async {
    if (kDebugMode) {
      print("nik $nik");
    }
    Uri uri = Uri.parse("${baseUrl}check?username=$username&nik=$nik");
    if (kDebugMode) {
      print("uri $uri");
    }
    var api = await http.get(uri);
    var jsonObject = json.decode(api.body);
    var decoJson = CounterHazard.fromJson(jsonObject);
    return decoJson;
  }

  Future<AllHazard?> getAllHazard(
      int disetujui, int page, String dari, String sampai) async {
    var api = await http.get(
      Uri.parse(
          "${Constants.baseUrl}api/v1/hazard/safety?user_valid=$disetujui&page=$page&dari=$dari&sampai=$sampai"),
    );

    var jsonObject = json.decode(api.body);
    var decoJson = AllHazard.fromJson(jsonObject);
    return decoJson;
  }

  Future<HazardUser?> getHazardUser(
    username,
    disetujui,
    page,
    dari,
    sampai,
  ) async {
    // Uri uri = Uri.parse(
    //     "https://abpjobsite.com/android/api/hse/list/hazard/report/online?username=$username&page=$page&dari=$dari&sampai=$sampai&user_valid=$disetujui");
    Uri uri = Uri.parse(
        "https://lp.abpjobsite.com/api/v1/hazard/user?username=$username&page=$page&dari=$dari&sampai=$sampai&user_valid=$disetujui");
    var api = await http.get(uri);

    var jsonObject = json.decode(api.body);
    var decoJson = HazardUser.fromJson(jsonObject);
    return decoJson;
  }

  Future<HazardUser?> getHazardKeSaya(
    nik,
    disetujui,
    page,
    dari,
    sampai,
  ) async {
    var api = await http.get(Uri.parse(
        "${baseUrl}kesaya?nik=$nik&page=$page&dari=$dari&sampai=$sampai&user_valid=$disetujui"));

    var jsonObject = json.decode(api.body);
    var decoJson = HazardUser.fromJson(jsonObject);
    return decoJson;
  }

  Future<ResultHazardPost?> postGambarBukti(
      HazardGambarBukti data, idDevice) async {
    Map<String, dynamic>? res;

    DateTime dt = DateTime.now();

    String filename =
        "${"${dt.hour}".padLeft(2, "0")}${"${dt.minute}".padLeft(2, "0")}${"${dt.second}".padLeft(2, "0")}_${idDevice}_sebelum.jpg";

    Uri uri = Uri.parse("${baseUrl}rubah/gambar/temuan");

    var request = http.MultipartRequest("POST", uri);

    request.files.add(http.MultipartFile.fromBytes(
        'bukti_sebelum', await data.buktiSebelum!.readAsBytes(),
        filename: filename));

    request.fields['uid'] = "${data.uid}";

    var response = await request.send();

    await for (String s in response.stream.transform(utf8.decoder)) {
      res = jsonDecode(s);
    }
    return ResultHazardPost.fromJson(res!);
  }

  Future<ResultHazardPost?> postGambarPerbaikan(
      HazardGambarPerbaikan data, idDevice) async {
    Map<String, dynamic>? res;

    DateTime dt = DateTime.now();

    String filename =
        "${"${dt.hour}".padLeft(2, "0")}${"${dt.minute}".padLeft(2, "0")}${"${dt.second}".padLeft(2, "0")}_${idDevice}_selesai.jpg";

    Uri uri = Uri.parse("${baseUrl}rubah/gambar/perbaikan");

    var request = http.MultipartRequest("POST", uri);

    request.files.add(http.MultipartFile.fromBytes(
        'bukti_selesai', await data.buktiSelesai!.readAsBytes(),
        filename: filename));

    request.fields['uid'] = "${data.uid}";

    var response = await request.send();

    await for (String s in response.stream.transform(utf8.decoder)) {
      res = jsonDecode(s);
    }
    return ResultHazardPost.fromJson(res!);
  }

  Future<Data?> getHazardDetail(
    uid,
  ) async {
    var api = await http.get(Uri.parse("${baseUrl}detail?uid=$uid"));

    var jsonObject = json.decode(api.body);
    var decoJson = Data.fromJson(jsonObject);
    return decoJson;
  }

  Future<ResultHazardPost?> postUpdateDeskripsi(uid, tipe, deskripsi) async {
    String apiUrl = "${baseUrl}rubah/deskripsi";
    var apiResult = await http.post(Uri.parse(apiUrl),
        body: {"uid": uid, "tipe": tipe, "deskripsi": deskripsi});
    var jsonObject = json.decode(apiResult.body);
    return ResultHazardPost.fromJson(jsonObject);
  }

  Future<ResultHazardPost?> postUpdateResiko(uid, tipe, idResiko) async {
    String apiUrl = "${baseUrl}rubah/resiko";
    var apiResult = await http.post(Uri.parse(apiUrl),
        body: {"uid": uid, "tipe": tipe, "idResiko": idResiko});
    var jsonObject = json.decode(apiResult.body);
    return ResultHazardPost.fromJson(jsonObject);
  }

  Future<ResultHazardPost?> postUpdatePengendalian(uid, idPengendalian) async {
    String apiUrl = "${baseUrl}rubah/pengendalian";
    var apiResult = await http.post(Uri.parse(apiUrl),
        body: {"uid": uid, "idPengendalian": idPengendalian});
    var jsonObject = json.decode(apiResult.body);
    return ResultHazardPost.fromJson(jsonObject);
  }

  Future<ResultHazardPost?> postUpdateKatBahaya(uid, katBahaya) async {
    String apiUrl = "${baseUrl}rubah/katBahaya";
    var apiResult = await http
        .post(Uri.parse(apiUrl), body: {"uid": uid, "katBahaya": katBahaya});
    var jsonObject = json.decode(apiResult.body);
    return ResultHazardPost.fromJson(jsonObject);
  }
}

class BeritaProvider {
  Future<berita.BeritaModel> getBuletin(page) async {
    var url = Uri.parse("${Constants.baseUrl}api/v1/message/info?page=$page");
    var apiWeb = await http.get(url);
    var objekJson = json.decode(apiWeb.body);
    return berita.BeritaModel.fromJson(objekJson);
  }
}

class DeviceUpdateProvider {
  Future<DeviceUpdateModel?> getDevice() async {
    var api = await http
        .get(Uri.parse("https://lp.abpjobsite.com/api/v1/device/update"));
    var jsonObject = json.decode(api.body);
    var decoJson = DeviceUpdateModel.fromJson(jsonObject);
    return decoJson;
  }

  Future<DeviceUpdateModel?> getDeviceBy(idDevice) async {
    var api = await http.get(Uri.parse(
        "https://lp.abpjobsite.com/api/v1/device/update?idDevice=$idDevice"));
    var jsonObject = json.decode(api.body);
    var decoJson = DeviceUpdateModel.fromJson(jsonObject);
    return decoJson;
  }

  Future<DeviceUpdateModel?> getDeviceIn(idDevice, tipe) async {
    var api = await http.get(
        Uri.parse(
            "https://lp.abpjobsite.com/api/v1/device/update/by?idDevice=$idDevice"),
        headers: {"tipe": json.encode(tipe)});
    var jsonObject = json.decode(api.body);
    var decoJson = DeviceUpdateModel.fromJson(jsonObject);
    return decoJson;
  }

  Future<DeviceUpdateModel?> getDeviceTipe(idDevice, tipe) async {
    var api = await http.post(
        Uri.parse("https://lp.abpjobsite.com/api/v1/device/update/by"),
        body: {"idDevice": idDevice, "tipe": json.encode(tipe)});
    var jsonObject = json.decode(api.body);
    var decoJson = DeviceUpdateModel.fromJson(jsonObject);
    return decoJson;
  }

  Future<DeviceUpdateResult> insertDeviceUpdate(idDevice, tipe) async {
    var api = await http.post(
        Uri.parse("https://lp.abpjobsite.com/api/v1/device/update"),
        body: {"idDevice": idDevice, "tipe": json.encode(tipe)});
    var jsonObject = json.decode(api.body);
    var decoJson = DeviceUpdateResult.fromJson(jsonObject);
    return decoJson;
  }
}

class DoPresensi {
  Future<StatusAbsensi> takePresensi(PostAbsen data, String idDevice) async {
    Map<String, dynamic>? res;
    var uuid = const Uuid();

    DateTime dt = DateTime.now();

    String filename =
        "${data.nik}_${"${dt.hour}".padLeft(2, "0")}${"${dt.minute}".padLeft(2, "0")}${"${dt.second}".padLeft(2, "0")}_${idDevice}_${data.status}_${uuid.v1()}.jpg";
    var uri =
        Uri.parse("https://lp.abpjobsite.com/api/v1/presensi/upload/absensi");
    var request = http.MultipartRequest('POST', uri);

    request.files.add(http.MultipartFile.fromBytes(
        'fileToUpload', await data.fileToUpload!.readAsBytes(),
        filename: filename));
    request.fields['nik'] = "${data.nik}";
    request.fields['lat'] = "${data.lat}";
    request.fields['lng'] = "${data.lng}";

    var response = await request.send();
    await for (String s in response.stream.transform(utf8.decoder)) {
      res = jsonDecode(s);
    }
    return StatusAbsensi.fromJson(res!);
  }
}

class BuletinApi {
  Future<buletin.Buletin?> getBuletinPage(int page) async {
    var api = await http.get(
        Uri.parse("https://lp.abpjobsite.com/api/v1/message/info?page=$page"));
    var jsonObject = json.decode(api.body);
    return buletin.Buletin.fromJson((jsonObject));
  }
}
