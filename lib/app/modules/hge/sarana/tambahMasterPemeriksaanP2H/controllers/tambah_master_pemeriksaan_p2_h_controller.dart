import 'package:face_id_plus/app/data/models/master_pemeriksaan_model.dart';
import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../data/providers/p2h_provider.dart';

class TambahMasterPemeriksaanP2HController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final provider = P2hProvider();
  final diperiksaCtrl = TextEditingController().obs;
  final diperiksaFocus = FocusNode();
  final username = RxnString(null);
  @override
  void onInit() async {
    var pref = await SharedPreferences.getInstance();
    username.value = pref.getString(Constants.username);
    diperiksaFocus.requestFocus();
    super.onInit();
  }

  postData() async {
    if (formKey.currentState!.validate()) {
      var body = MasterPemeriksaan();
      body.diperiksa = diperiksaCtrl.value.text;
      body.userInput = "${username.value}";
      body.idPemeriksaan = 0;
      body.flagPemeriksaan = 0;
      body.timeInput = '';
      await provider.tambahDaftarPemeriksaan(body).then((value) {
        var success = value.success;
        if (success!) {
          Get.back(result: true);
          Get.snackbar("Berhasil", "Berhasil Menambah Data",
              colorText: Colors.white, backgroundColor: Colors.green);
        } else {
          Get.snackbar("Gagal", "Gagal Menambah Data",
              colorText: Colors.white, backgroundColor: Colors.red);
        }
      }).onError((error, stackTrace) {
        if (kDebugMode) {
          print("error $error");
        }
      });
    }
  }
}
