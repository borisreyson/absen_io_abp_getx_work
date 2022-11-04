import 'package:face_id_plus/app/data/providers/sarana_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RubahFormSaranaController extends GetxController {
  final provider = SaranaProvider();
  final formKey = GlobalKey<FormState>();
  final loaded = false.obs;
  final fil = RxnString(null);
  final no = RxnString(null);
  final deskripsi = RxnString(null);
  final deskCtrl = TextEditingController().obs;
  final deskRubahCtrl = TextEditingController().obs;
  final deskFocus = FocusNode();
  final deskRubahFocus = FocusNode();
  @override
  void onInit() async {
    var field = await Get.arguments['field'];
    var noId = await Get.arguments['no'];
    var desc = await Get.arguments['desc'];
    if (field != null && no != null && desc != null) {
      fil.value = field;
      no.value = "$noId";

      deskripsi.value = "$desc";
      if (fil.value == "pic_lv") {
        print("1 ${deskripsi.value}");
        getDataKaryawan(deskripsi.value);
      } else {
        print("2 ${deskripsi.value}");

        deskCtrl.value.text = "$desc";
      }

      loaded.value = true;
    } else {
      loaded.value = false;
    }
    super.onInit();
  }

  void simpan() async {
    if (formKey.currentState!.validate()) {
      var body = UpdateSarana();
      body.data = deskRubahCtrl.value.text;
      body.field = fil.value;
      body.no = no.value;
      print("${body.data}");
      await provider.rubahSarana(body).then((value) {
        if (value.success != null) {
          if (value.success!) {
            Get.back(result: body.data);
            Get.snackbar("Success", "Data Telah Di Rubah ${value.success}",
                backgroundColor: Colors.green, colorText: Colors.white);
          } else {
            Get.snackbar("Gagal", "Gagal Di Rubah ${value.success}",
                backgroundColor: Colors.red, colorText: Colors.white);
          }
        } else {
          Get.snackbar("Gagal", "Gagal Di Rubah ${value.success}",
              backgroundColor: Colors.red, colorText: Colors.white);
        }
      });
    }
  }

  getDataKaryawan(String? nik) async {
    await provider.getKaryawan(nik).then((value) {
      if (value.karyawan != null) {
        var karyawan = value.karyawan;
        deskCtrl.value.text = "${karyawan?.nama}";
      }
    });
  }
}
