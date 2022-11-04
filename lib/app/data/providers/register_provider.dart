import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/login_model.dart';
import '../models/lupa_sandi_detail.dart';

class RegisterProvider {
  bool? success = false;
  RegisterProvider({this.success});
  factory RegisterProvider.fromJson(Map<String, dynamic> json) {
    return RegisterProvider(success: json['success']);
  }
  Future<RegisterProvider> cekNik(String? nik) async {
    var url =
        Uri.parse("https://lp.abpjobsite.com/api/v1/cek/nik/login?nik=$nik");
    var api = await http.get(url);
    var jsonEncode = json.decode(api.body);
    return RegisterProvider.fromJson(jsonEncode);
  }

  Future<LupaSandiDetail> cekNikDetail(String? nik) async {
    var url = Uri.parse(
        "https://lp.abpjobsite.com/api/v1/cek/nik/login/detail?nik=$nik");
    var api = await http.get(url);
    var jsonEncode = json.decode(api.body);
    return LupaSandiDetail.fromJson(jsonEncode);
  }

  Future<LupaSandiDetail> cekUsernameDetail(String? username) async {
    var url = Uri.parse(
        "https://lp.abpjobsite.com/api/v1/cek/username/login/detail?username=$username");
    var api = await http.get(url);
    var jsonEncode = json.decode(api.body);
    return LupaSandiDetail.fromJson(jsonEncode);
  }

  Future<RegisterProvider> cekUsername(String? username) async {
    var url = Uri.parse(
        "https://lp.abpjobsite.com/api/v1/cek/username/login?username=$username");
    var api = await http.get(url);
    var jsonEncode = json.decode(api.body);
    return RegisterProvider.fromJson(jsonEncode);
  }

  Future<ResultPost> postRegister(body) async {
    var url = Uri.parse("https://lp.abpjobsite.com/api/v1/register/abpenergy");
    var apiWeb = await http.post(
      url,
      body: json.encode(body.toJson()),
      headers: {"Content-Type": "application/json"},
    );
    var objekJson = json.decode(apiWeb.body);
    return ResultPost.fromJson(objekJson);
  }

  Future<ResultPostOTP> postOtpPassword(CreateOtpPassword body) async {
    var url =
        Uri.parse("https://lp.abpjobsite.com/api/v1/p2h/create/otp/password");
    var apiWeb = await http.post(
      url,
      body: body.toJson(),
    );
    var objekJson = json.decode(apiWeb.body);
    return ResultPostOTP.fromJson(objekJson);
  }

  Future<ResultPost> verifikasiOtpPassword(ValidOtpPassword body) async {
    var url = Uri.parse(
        "https://lp.abpjobsite.com/api/v1/p2h/verifikasi/otp/password");
    var apiWeb = await http.post(
      url,
      body: body.toJson(),
    );
    var objekJson = json.decode(apiWeb.body);
    return ResultPost.fromJson(objekJson);
  }

  Future<ResultPost> postSandiBaru(LoginABP body) async {
    var url =
        Uri.parse("https://lp.abpjobsite.com/api/v1/p2h/simapn/sandi/baru");
    var apiWeb = await http.post(
      url,
      body: body.toJson(),
    );
    var objekJson = json.decode(apiWeb.body);
    return ResultPost.fromJson(objekJson);
  }

  Future<dynamic> sendEmail() async {
    var url = Uri.parse("https://abpjobsite.com/cron/job/interval/time");
    var api = await http.get(url);
    var jsonEncode = json.decode(api.body);
    return jsonEncode;
  }
}

class ListDataKaryawan {
  bool? success;
  List<ListDepartemen>? departemen;
  List<ListDevisi>? devisi;
  List<ListPerusahaan>? perusahaan;
  ListDataKaryawan(
      {this.success, this.departemen, this.devisi, this.perusahaan});
  ListDataKaryawan.fromJson(Map<String, dynamic> data) {
    data["success"];

    if (data["departemen"] != null) {
      departemen = <ListDepartemen>[];
      data["departemen"].forEach((e) {
        departemen!.add(ListDepartemen.fromJson(e));
      });
    }

    if (data["devisi"] != null) {
      devisi = <ListDevisi>[];
      data["devisi"].forEach((e) {
        devisi!.add(ListDevisi.fromJson(e));
      });
    }
    if (data["perusahaan"] != null) {
      perusahaan = <ListPerusahaan>[];
      data["perusahaan"].forEach((e) {
        perusahaan!.add(ListPerusahaan.fromJson(e));
      });
    }
  }

  Future<ListDataKaryawan> getDepartemen() async {
    var url =
        Uri.parse("https://lp.abpjobsite.com/api/v1/cek/departemen/login");
    var api = await http.get(url);
    var jsonObject = json.decode(api.body);
    return ListDataKaryawan.fromJson(jsonObject);
  }

  Future<ListDataKaryawan> getDevisi(idDept) async {
    var url = Uri.parse(
        "https://lp.abpjobsite.com/api/v1/cek/devisi/login?idDept=$idDept");
    var api = await http.get(url);
    var jsonObject = json.decode(api.body);
    return ListDataKaryawan.fromJson(jsonObject);
  }
}

class ListDepartemen {
  int? id;
  String? idDept;
  String? dept;
  int? company;
  ListDepartemen({this.id, this.idDept, this.dept, this.company});
  factory ListDepartemen.fromJson(Map<String, dynamic> json) {
    return ListDepartemen(
      id: json['id'],
      idDept: json['id_dept'],
      dept: json['dept'],
      company: json['company'],
    );
  }
}

class ListDevisi {
  int? inc;
  String? idSect;
  String? idDept;
  String? sect;
  ListDevisi({this.inc, this.idSect, this.idDept, this.sect});
  factory ListDevisi.fromJson(Map<String, dynamic> json) {
    return ListDevisi(
      inc: json["inc"],
      idSect: json["id_sect"],
      idDept: json["id_dept"],
      sect: json["sect"],
    );
  }
}

class ListPerusahaan {
  int? idPerusahaan;
  String? namaPerusahaan;
  ListPerusahaan({this.idPerusahaan, this.namaPerusahaan});
  factory ListPerusahaan.fromJson(Map<String, dynamic> json) {
    return ListPerusahaan(
      idPerusahaan: json["id_perusahaan"],
      namaPerusahaan: json["nama_perusahaan"],
    );
  }
}

class DaftarPost {
  String? username;
  String? nik;
  String? nama;
  String? email;
  String? dept;
  String? devisi;
  String? jabatan;
  String? perusahaan;
  String? sandi;
  DaftarPost(
      {this.username,
      this.nik,
      this.nama,
      this.email,
      this.dept,
      this.devisi,
      this.jabatan,
      this.perusahaan,
      this.sandi});

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["username"] = username;
    data["nik"] = nik;
    data["namaLengkap"] = nama;
    data["email"] = email;
    data["department"] = dept;
    data["section"] = devisi;
    data["jabatan"] = jabatan;
    data["perusahaan"] = perusahaan;
    data["password"] = sandi;
    return data;
  }
}

class ResultPost {
  bool success;
  ResultPost({required this.success});
  factory ResultPost.fromJson(Map<String, dynamic> json) {
    return ResultPost(success: json["success"]);
  }
}

class CreateOtpPassword {
  String? login;
  CreateOtpPassword({this.login});
  factory CreateOtpPassword.fromJson(Map<String, dynamic> json) {
    return CreateOtpPassword(login: json['login']);
  }
  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['login'] = login;
    return data;
  }
}

class ValidOtpPassword {
  String? username;
  String? tokenPassword;
  ValidOtpPassword({this.username, this.tokenPassword});
  factory ValidOtpPassword.fromJson(Map<String, dynamic> json) {
    return ValidOtpPassword(
        username: json['username'], tokenPassword: json['tokenPassword']);
  }
  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['username'] = username;
    data['tokenPassword'] = tokenPassword;
    return data;
  }
}

class ResultPostOTP {
  int? createToken;
  bool? success;

  ResultPostOTP({this.createToken, this.success});

  ResultPostOTP.fromJson(Map<String, dynamic> json) {
    createToken = json['create_token'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['create_token'] = createToken;
    data['success'] = success;
    return data;
  }
}
