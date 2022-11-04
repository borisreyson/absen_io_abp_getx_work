import 'dart:convert';

import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class QrCodeResultController extends GetxController {
  final idQrCode = RxnString(null);
  final titleQrCode = RxnString(null);
  final nik = RxnString(null);
  final loaded = false.obs;

  @override
  void onInit() async {
    var pref = await SharedPreferences.getInstance();
    nik.value = pref.getString(Constants.nik);
    generateQrProfile();
    super.onInit();
  }

  generateQrProfile() async {
    loaded.value = false;
    await binToHex(nik.value).then((value) {
      var id = value.encrypt;
      idQrCode.value = "http://abpjobsite.com/company/employee/profile/$id";
      titleQrCode.value = "QR-Code Profile";
    }).whenComplete(() {
      loaded.value = true;
    });
  }

  generateQrInspeksi() async {
    loaded.value = false;
    await binToHex(nik.value).then((value) {
      var id = value.encrypt;
      idQrCode.value = "inspeksi/qrcode/id/$id";
      titleQrCode.value = "QR-Code Inspeksi";
    }).whenComplete(() {
      loaded.value = true;
    });
  }

  Future<ResultConvert> binToHex(text) async {
    var url = Uri.parse(
        "https://lp.abpjobsite.com/api/v1/cuti/generate/bin/to/hex?binToHex=$text");
    var api = await http.get(url);
    var objekJson = json.decode(api.body);
    return ResultConvert.fromJson(objekJson);
  }
}

Future<ResultConvert> hexToBin(text) async {
  var url = Uri.parse(
      "https://lp.abpjobsite.com/api/v1/cuti/generate/hex/to/bin?hexToBin=$text");
  var api = await http.get(url);
  var objekJson = json.decode(api.body);
  return ResultConvert.fromJson(objekJson);
}

class ResultConvert {
  String? encrypt;
  ResultConvert({this.encrypt});

  factory ResultConvert.fromJson(Map<String, dynamic> json) {
    return ResultConvert(encrypt: json['encrypt']);
  }
}
