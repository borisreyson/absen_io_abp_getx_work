import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:face_id_plus/app/modules/hge/cuti/providers/cuti_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:face_id_plus/app/modules/hge/cuti/models/list_cuti_model.dart';

class CutiKeHCController extends GetxController {
  final provider = ProviderCuti();
  final dataCuti = <Data>[].obs;
  final nikKaryawan = RxnString(null);
  final username = RxnString(null);
  final lastPage = 1.obs;
  final page = 1.obs;
  final loaded = false.obs;
  final fmt = DateFormat('dd MMMM yyyy');
  final jam = DateFormat("HH:mm:ss");
  final rule = RxnString(null);
  final section = RxnString(null);
  final refreshCtrl = RefreshController();
  final pullUp = false.obs;

  @override
  void onInit() async {
    var pref = await SharedPreferences.getInstance();
    nikKaryawan.value = pref.getString(Constants.nik);
    username.value = pref.getString(Constants.username);
    rule.value = pref.getString(Constants.rule);
    section.value = pref.getString(Constants.section);
    dataCuti.clear();
    page.value = 1;
    hcGetCuti(section.value, page.value);
    super.onInit();
  }

  hcGetCuti(section, hal) async {
    await provider.getCutiHC(section: section, page: hal).then((value) {
      var res = value.cutiOnline;
      if (res != null) {
        var response = res.data;
        lastPage.value = int.parse("${res.lastPage}");
        if (page.value == lastPage.value) {
          pullUp.value = false;
        } else {
          pullUp.value = true;
        }
        if (response != null) {
          for (var e in response) {
            dataCuti.add(e);
          }
          refreshCtrl.refreshCompleted();
          refreshCtrl.loadComplete();
        }
      }
    }).whenComplete(() {
      loaded.value = true;
    });
  }

  void setujuiHC(idCutiOnline) async {
    var res = await Constants().showAlert(
        judul: "Persetujuan",
        msg: "Apakah anda yakin untuk menyetujui?",
        dismiss: true,
        fBtn: "Setujui",
        sBtn: "Tidak",
        del: true);
    if (res != null) {
      if (res) {
        Constants().showAlert(
          dismiss: true,
          loading: true,
          enBtn: false,
        );
        await provider
            .setujuiHC("${username.value}", idCutiOnline)
            .then((value) {
          var success = value.success;
          if (success!) {
            Get.back();
            Get.snackbar("Berhasil", "Pengajuan Cuti Telah Di Setujui",
                backgroundColor: Colors.green, colorText: Colors.white);
          } else {
            Get.back();
            Get.snackbar("Gagal", "Menyetujui Gagal, Coba Lagi!",
                backgroundColor: Colors.red, colorText: Colors.white);
          }
          onRefresh();
        });
      }
    }
  }

  void batalkanHC(idCutiOnline) async {
    var res = await Constants().showFormAlert(
      judul: "Pembatalan Cuti",
      dismiss: true,
      fBtn: "Kirim",
      sBtn: "Tidak",
      label: "Ketarangan Pembatalan",
    );
    if (res != null) {
      if (res[0]) {
        var keteranganBatal = res[1] as String;
        Constants().showAlert(
          dismiss: true,
          loading: true,
          enBtn: false,
        );
        await provider
            .batalkanCutiOnline(
                "${username.value}", idCutiOnline, keteranganBatal)
            .then((value) {
          var success = value.success;
          if (success!) {
            Get.back();
            Get.snackbar("Berhasil", "Pengajuan Cuti Telah Di Batalkan",
                backgroundColor: Colors.green, colorText: Colors.white);
          } else {
            Get.back();
            Get.snackbar("Gagal", "Membatalkan Gagal, Coba Lagi!",
                backgroundColor: Colors.red, colorText: Colors.white);
          }
          onRefresh();
        });
      }
    }
  }

  void onRefresh() {
    page.value = 1;
    dataCuti.clear();
    hcGetCuti(section.value, page.value);
  }

  void onLoading() {
    if (page.value < lastPage.value) {
      page.value++;
      hcGetCuti(section.value, page.value);
    } else {
      if (page == lastPage) {
        pullUp.value = false;
      } else {
        pullUp.value = true;
      }
    }
  }
}
