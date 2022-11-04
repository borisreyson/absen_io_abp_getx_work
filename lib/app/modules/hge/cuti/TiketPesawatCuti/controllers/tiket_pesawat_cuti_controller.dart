import 'dart:convert';

import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:face_id_plus/app/modules/hge/cuti/models/form_cuti_model.dart';
import 'package:face_id_plus/app/modules/hge/cuti/models/tiket_mode.dart';
import 'package:face_id_plus/app/modules/hge/cuti/providers/cuti_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TiketPesawatCutiController extends GetxController {
  final provider = ProviderCuti();
  final formKey = GlobalKey<FormState>();
  final namaCtrl = TextEditingController();
  final tglLahirCtrl = TextEditingController();
  final hpCtrl = TextEditingController();
  final berangkatDariCtrl = TextEditingController();
  final berangkatTujuanCtrl = TextEditingController();
  final berangkatTglCtrl = TextEditingController();
  final berangkatJamCtrl = TextEditingController();
  final maskapaiCtrl = TextEditingController();
  final kembaliDariCtrl = TextEditingController();
  final kembaliTujuanCtrl = TextEditingController();
  final kembaliTglCtrl = TextEditingController();
  final kembaliJamCtrl = TextEditingController();
  final kembaliMaskapaiCtrl = TextEditingController();

  final namaFocus = FocusNode();
  final tglLahirFocus = FocusNode();
  final hpFocus = FocusNode();
  final berangkatDariFocus = FocusNode();
  final berangkatTujuanFocus = FocusNode();
  final berangkatTglFocus = FocusNode();
  final beranglatJamFocus = FocusNode();
  final maskapaiFocus = FocusNode();
  final kembaliDariFocus = FocusNode();
  final kembaliTujuanFocus = FocusNode();
  final kembaliTglFocus = FocusNode();
  final kembaliJamFocus = FocusNode();
  final kembaliMaskapaiFocus = FocusNode();
  final formCuti = FormCutiModel().obs;
  final tglCuti = TanggalCuti().obs;

  final fmt = DateFormat('dd MMMM yyyy');
  final dt = DateTime.now();
  final testerString = RxnString(null);
  @override
  void onInit() async {
    var ar = await Get.arguments;
    if (ar != null) {
      var pertama = await Get.arguments['formCuti'];
      if (pertama != null) {
        formCuti.value = pertama;
        // print("formCuti ${formCuti.value.namaKaryawan}");
      }
      var kedua = await Get.arguments['tglCuti'];

      if (kedua != null) {
        tglCuti.value = kedua;
      }
    }
    super.onInit();
  }

  void simpanCuti() async {
    if (formKey.currentState!.validate()) {
      Constants().showAlert(
        dismiss: true,
        loading: true,
        enBtn: false,
      );
      var berangkat = TiketPesawat();
      berangkat.berangkatDari = berangkatDariCtrl.text;
      berangkat.tujuan = berangkatTujuanCtrl.text;
      berangkat.tglTerbang = berangkatTglCtrl.text;
      berangkat.jamTerbang = berangkatJamCtrl.text;
      berangkat.maskapai = maskapaiCtrl.text;

      var kembali = TiketPesawat();
      kembali.berangkatDari = kembaliDariCtrl.text;
      kembali.tujuan = kembaliTujuanCtrl.text;
      kembali.tglTerbang = kembaliTglCtrl.text;
      kembali.jamTerbang = kembaliJamCtrl.text;
      kembali.maskapai = kembaliMaskapaiCtrl.text;
      var pengajuan = PengajuanTiket();
      pengajuan.tiketBerangkat = berangkat;
      pengajuan.tiketKembali = kembali;

      var cutiPost = CutiPost();
      cutiPost.formCuti = formCuti.value;
      cutiPost.tglCuti = tglCuti.value;
      cutiPost.tiketCuti = pengajuan;

      await provider.cutiPostApi(cutiPost).then((value) {
        var res = value.success;
        if (res!) {
          Get.back();
          Get.back(result: true);
        } else {
          Get.back();
          Get.snackbar("Gagal", "Gagal Membuat Cuti Online, Coba Lagi!",
              colorText: Colors.white, backgroundColor: Colors.red);
        }
      });
    }
  }

  Future<DateTime?> selectDate(BuildContext context, DateTime initDate) async {
    return await DatePicker.showDatePicker(context,
        showTitleActions: true, minTime: dt, currentTime: initDate);
  }

  Future<DateTime?> seletTime(BuildContext context, DateTime jamHazard) async {
    return await DatePicker.showTimePicker(context,
        showTitleActions: true, currentTime: jamHazard);
  }
}
