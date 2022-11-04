import 'package:face_id_plus/app/data/providers/register_provider.dart';
import 'package:face_id_plus/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class NextRegisterController extends GetxController {
  final provider = RegisterProvider();
  final formKey = GlobalKey<FormState>();
  final usernameCtrl = TextEditingController().obs;
  final nikCtrl = TextEditingController().obs;
  final namaCtrl = TextEditingController().obs;
  final emailCtrl = TextEditingController().obs;
  final deptCtrl = TextEditingController().obs;
  final devisiCtrl = TextEditingController().obs;
  final jabatanCtrl = TextEditingController().obs;
  final perusahaanCtrl = TextEditingController().obs;
  final sandiCtrl = TextEditingController().obs;
  final ulangiSandiCtrl = TextEditingController().obs;

  final usernameFocus = FocusNode().obs;
  final nikFocus = FocusNode().obs;
  final namaFocus = FocusNode().obs;
  final emailFocus = FocusNode().obs;
  final deptFocus = FocusNode().obs;
  final devisiFocus = FocusNode().obs;
  final jabatanFocus = FocusNode().obs;
  final perusahaanFocus = FocusNode().obs;
  final sandiFocus = FocusNode().obs;
  final ulangiSandiFocus = FocusNode().obs;

  final regButton = RoundedLoadingButtonController();

  final idDept = RxnString(null);
  final idSect = RxnString(null);
  final idPerusahaan = RxnString(null);
  final validMail = RxBool(false);
  final validSandi = RxBool(false);
  final sameSandi = RxBool(false);
  final sandiSama = RxBool(false);

  final mailIcon = const Icon(
    Icons.cancel_outlined,
    color: Colors.red,
  ).obs;
  final usernameIcon = const Icon(
    Icons.cancel_outlined,
    color: Colors.red,
  ).obs;

  final sandiIcon = const Icon(
    Icons.cancel_outlined,
    color: Colors.red,
  ).obs;

  final ulangiSandiIcon = const Icon(
    Icons.cancel_outlined,
    color: Colors.red,
  ).obs;

  @override
  void onInit() async {
    var nik = await Get.arguments['nik'];
    if (nik != null) {
      nikCtrl.value.text = nik;
    }
    var username = await Get.arguments['username'];
    if (username != null) {
      usernameCtrl.value.text = username;
    }
    super.onInit();
  }

  void registerAkun() async {
    regButton.stop();
    regButton.reset();
    if (formKey.currentState!.validate()) {
      DaftarPost body = DaftarPost();
      body.username = usernameCtrl.value.text;
      body.nama = namaCtrl.value.text;
      body.email = emailCtrl.value.text;
      body.sandi = sandiCtrl.value.text;
      body.nik = nikCtrl.value.text;
      body.dept = "$idDept";
      body.devisi = "$idSect";
      body.jabatan = jabatanCtrl.value.text;
      body.perusahaan = "$idPerusahaan";
      if (kDebugMode) {
        print("body ${body.username}");
      }
      await provider.postRegister(body).then((value) {
        // ignore: unnecessary_null_comparison
        if (value != null) {
          if (value.success) {
            Get.back();
            Get.back();

            Get.snackbar("Berhasil", "Akun Telah Di Daftar",
                backgroundColor: Colors.green, colorText: Colors.white);
          } else {
            Get.back();
            Get.back();

            Get.snackbar("Gagal", "Gagal Mendaftar Akun, Coba Lagi!",
                backgroundColor: Colors.red, colorText: Colors.white);
          }
        } else {
          Get.back();
          Get.back();

          Get.snackbar("Gagal", "Gagal Mendaftar Akun, Coba Lagi!",
              backgroundColor: Colors.red, colorText: Colors.white);
        }
      });
    }
  }

  departemen() async {
    var dept = await Get.toNamed(Routes.DEPARTEMEN);
    if (dept != null) {
      deptCtrl.value.text = "${dept.dept}";
      idDept.value = "${dept.idDept}";
    } else {
      idDept.value = null;
      deptCtrl.value.clear();
    }
  }

  devisi() async {
    if (idDept.value != null) {
      var devisi =
          await Get.toNamed(Routes.DEVISI, arguments: {"idDept": idDept.value});
      if (devisi != null) {
        devisiCtrl.value.text = "${devisi.sect}";
        idSect.value = "${devisi.idSect}";
      } else {
        devisiCtrl.value.clear();
        idSect.value = null;
      }
    } else {
      Get.snackbar("Error", "Harap Memilih Departemen Terlebih Dahulu",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  perusahaan() async {
    var company = await Get.toNamed(Routes.PERUSAHAAN);
    if (company != null) {
      perusahaanCtrl.value.text = "${company.namaPerusahaan}";
      idPerusahaan.value = "${company.idPerusahaan}";
    } else {
      idPerusahaan.value = null;
      perusahaanCtrl.value.clear();
    }
  }
}
