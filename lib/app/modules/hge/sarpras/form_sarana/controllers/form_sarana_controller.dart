import 'dart:convert';

import 'package:face_id_plus/app/data/models/sarana_models.dart';
import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../data/providers/provider.dart';

class FormSaranaController extends GetxController {
  final provider = Provider();
  final dt = DateTime.now();
  final fmt = DateFormat('dd MMMM yyyy');
  final jam = DateFormat("HH:mm:ss");
  final formKey = GlobalKey<FormState>();
  final noLvCtrl = TextEditingController();
  final tglKeluarCtrl = TextEditingController();
  final jamkeluarCtrl = TextEditingController();
  final keteranganCtrl = TextEditingController();
  final penumpangCtrl = TextEditingController();
  final driverCtrl = TextEditingController();
  final pemohonCtrl = TextEditingController();
  final tglKembaliCtrl = TextEditingController();
  final jamKembaliCtrl = TextEditingController();

  final noLvFocus = FocusNode();
  final tglKeluarFocus = FocusNode();
  final jamkeluarFocus = FocusNode();
  final keteranganFocus = FocusNode();
  final penumpangFocus = FocusNode();
  final driverFocus = FocusNode();
  final pemohonFocus = FocusNode();
  final tglKembaliFocus = FocusNode();
  final jamKembaliFocus = FocusNode();

  final nama = RxnString(null);
  final nik = RxnString(null);
  final username = RxnString(null);
  final nikDriver = RxnString(null);

  final penumpangDipilih = <String>[].obs;
  final listNikPenumpang = <String>[].obs;
  final isChecked = false.obs;
  @override
  void onInit() {
    getPref();
    super.onInit();
  }

  getPref() async {
    var pref = await SharedPreferences.getInstance();
    nama.value = pref.getString(Constants.name);
    nik.value = pref.getString(Constants.nik);
    username.value = pref.getString(Constants.username);
    pemohonCtrl.text = "${nama.value}";
  }

  tapNoLv() async {
    var result = await Get.toNamed(Routes.NOMOR_LAMBUNG);
    if (result != null) {
      noLvCtrl.text = result;
    }
  }

  Future<DateTime?> selectDate(BuildContext context, DateTime initDate) async {
    return await DatePicker.showDatePicker(context,
        showTitleActions: true, maxTime: dt, currentTime: initDate);
  }

  Future<DateTime?> seletTime(BuildContext context, DateTime jamHazard) async {
    return await DatePicker.showTimePicker(context,
        showTitleActions: true, currentTime: jamHazard);
  }

  void saveSarana() async {
    var body = PostIzinSarana();
    if (listNikPenumpang.isNotEmpty) {
      body.penumpang = listNikPenumpang.join(",");
    }
    body.pemohon = nik.value;
    body.username = username.value;
    body.noLv = noLvCtrl.text.toString();
    body.driver = nikDriver.value;
    body.tglKeluar = tglKeluarCtrl.text.toString();
    body.jamKeluar = jamkeluarCtrl.text.toString();
    body.keterangan = keteranganCtrl.text.toString();
    if (isChecked.value) {
      body.waktuMasuk = "${isChecked.value}";
      body.tglMasuk = tglKembaliCtrl.text.toString();
      body.jamMasuk = jamKembaliCtrl.text.toString();
    }

    await provider.postSarana(body).then((value) {
      if (value != null) {
        if (value.success!) {
          Get.back(result: true);
          Get.snackbar("Berhasil", "Surat Izin Dibuat");
        } else {
          Get.back(result: false);

          Get.snackbar("Gagal", "Surat Izin Gagal Dibuat");
        }
      }
    });
  }
}
