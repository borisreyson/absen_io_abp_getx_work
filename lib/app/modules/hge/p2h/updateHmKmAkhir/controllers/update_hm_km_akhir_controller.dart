import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:face_id_plus/app/data/models/p2h_sarana_models.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../data/models/p2h_sarana_mode.dart';
import '../../../../../data/providers/p2h_provider.dart';

class UpdateHmKmAkhirController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final provider = P2hProvider();
  final data = Data().obs;
  final loaded = false.obs;
  final noLvCtrl = TextEditingController();
  final noPolCtrl = TextEditingController();
  final hmKmAkhirCtrl = TextEditingController();
  final noLvFocus = FocusNode();
  final noPolFocus = FocusNode();
  final hmKmAkhirFocus = FocusNode();
  final fmt = DateFormat('dd MMMM yyyy');
  final userUpdate = RxnString(null);
  @override
  void onInit() async {
    var pref = await SharedPreferences.getInstance();
    userUpdate.value = pref.getString(Constants.username);
    var res = await Get.arguments['data'];
    if (res != null) {
      data.value = res;
      noLvCtrl.text = "${data.value.p2hNoLambung}";
      noPolCtrl.text = "${data.value.p2hNoPol}";
      loaded.value = true;
    }
    super.onInit();
  }

  simpan() async {
    if (formKey.currentState!.validate()) {
      var body = UpdateP2hHmKm();
      body.p2hId = "${data.value.p2hId}";
      body.hmKmAkhir = hmKmAkhirCtrl.text;
      body.userUpdate = userUpdate.value;
      await provider.updateP2hPost(body).then((value) {
        var success = value.success;
        if (success!) {
          Get.back(result: true);
          Get.snackbar("Success", "Data Berhasil Di Update",
              colorText: Colors.white, backgroundColor: Colors.green);
        } else {
          Get.snackbar("Gagal", "Data Gagal Di Update",
              colorText: Colors.white, backgroundColor: Colors.red);
        }
      });
    }
  }
}
