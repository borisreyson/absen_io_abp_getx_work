import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:face_id_plus/app/modules/hge/cuti/providers/cuti_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:face_id_plus/app/modules/hge/cuti/models/list_cuti_model.dart';

class CutiKeAtasanController extends GetxController {
  final provider = ProviderCuti();
  final dataCuti = <Data>[].obs;
  final username = RxnString(null);
  final nikKaryawan = RxnString(null);
  final lastPage = 1.obs;
  final page = 1.obs;
  final loaded = false.obs;
  final fmt = DateFormat('dd MMMM yyyy');
  final jam = DateFormat("HH:mm:ss");
  final refreshCtrl = RefreshController();
  final pullUp = false.obs;
  var dt = DateTime.now();
  final dari = DateTime.now().obs, sampai = DateTime.now().obs;
  final mulai = RxnString(null);
  final selesai = RxnString(null);
  final pesanError = RxnString(null);
  @override
  void onInit() async {
    var pref = await SharedPreferences.getInstance();
    nikKaryawan.value = pref.getString(Constants.nik);
    username.value = pref.getString(Constants.username);
    dataCuti.clear();
    page.value = 1;
    cutiGetAtasan(nikKaryawan.value, page.value);

    super.onInit();
  }

  cutiGetAtasan(nik, hal) async {
    await provider.getCutiAtasan(nik: nik, page: hal).then((value) {
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

  void setujuiAtasan(idCutiOnline) async {
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
            .setujuiAtasan("${username.value}", idCutiOnline)
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

  void batalkanAtasan(idCutiOnline) async {
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

  void onRefresh() async {
    page.value = 1;
    dataCuti.clear();
    await cutiGetAtasan(nikKaryawan.value, page.value);
  }

  reload() async {
    await cutiGetAtasan(nikKaryawan.value, page.value);
  }

  void onLoading() {
    if (page.value < lastPage.value) {
      page.value++;
      cutiGetAtasan(nikKaryawan.value, page.value);
    } else {
      if (page == lastPage) {
        pullUp.value = false;
      } else {
        pullUp.value = true;
      }
    }
  }

  void batalkanPerpanjangan(idCutiOnline) async {
    var res = await Constants().showFormAlert(
      judul: "Pembatalan Perpanjangan Cuti",
      dismiss: true,
      fBtn: "Kirim",
      sBtn: "Tidak",
      label: "Ketarangan Pembatalan Perpanjangan Cuti",
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
            .batalkanPerpanjanganCutiOnline(
                "${username.value}", idCutiOnline, keteranganBatal)
            .then((value) {
          var success = value.success;
          if (success!) {
            Get.back();
            Get.back();
            Get.snackbar("Berhasil", "Perpanjangan Dibatalkan",
                backgroundColor: Colors.green, colorText: Colors.white);
          } else {
            Get.back();
            Get.back();
            Get.snackbar("Gagal", "Membatalkan Perpanjangan Gagal, Coba Lagi!",
                backgroundColor: Colors.red, colorText: Colors.white);
          }
          onRefresh();
        });
      }
    }
  }

  void ubahTanggalCuti(idCutiOnline, value, String? tglMulaiCutiOnline,
      String? tglSelesaiCutiOnline, String? jenisCuti) async {
    var res = await Constants().showAlert(
        judul: "Persetujuan",
        msg: "Apakah anda yakin untuk Mengubah Tanggal Cuti?",
        dismiss: true,
        fBtn: "Setujui",
        sBtn: "Tidak",
        del: true);
    if (res != null) {
      if (res) {
        postUpdateCuti(idCutiOnline, value, tglMulaiCutiOnline,
            tglSelesaiCutiOnline, jenisCuti);
      }
    }
  }

  postUpdateCuti(
    idCutiOnline,
    value,
    String? tglMulaiCutiOnline,
    String? tglSelesaiCutiOnline,
    String? jenisCuti,
  ) async {
    var dari = value['dari'];
    var sampai = value['sampai'];
    await provider
        .ubahTanggalCuti("${username.value}", idCutiOnline, dari, sampai,
            tglMulaiCutiOnline, tglSelesaiCutiOnline, jenisCuti)
        .then((value) {
      var success = value.success;

      if (success!) {
        Get.snackbar("Berhasil", "Tanggal Cuti Dirubah",
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        Get.snackbar("Gagal", "Gagal Merubah Tanggal Cuti, Coba Lagi!",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
      onRefresh();
    });
  }

  Future<DateTime?> selectDate(BuildContext context, DateTime initDate) async {
    return await DatePicker.showDatePicker(context,
        showTitleActions: true, minTime: dt, currentTime: initDate);
  }

  Widget tglPick(String title, initial) {
    var inital = initial;
    TextStyle style =
        const TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
    return StatefulBuilder(
      builder: (context, stateSet) {
        return Card(
          color: Colors.orange,
          elevation: 10,
          child: InkWell(
              onTap: () async {
                var selected = await selectDate(context, inital!);
                if (selected != null) {
                  if (title == "Dari") {
                    stateSet(() {
                      dari.value = selected;
                      inital = selected;
                    });
                  } else if (title == "Sampai") {
                    stateSet(() {
                      sampai.value = selected;
                      inital = selected;
                    });
                  }
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      title,
                      style: style,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(fmt.format(inital!), style: style),
                  ],
                ),
              )),
        );
      },
    );
  }

  Widget submitWidgetDTrange() {
    TextStyle style =
        const TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
    return Card(
      color: Colors.orange,
      elevation: 10,
      child: InkWell(
          onTap: () async {
            mulai.value = fmt.format(dari.value);
            selesai.value = fmt.format(sampai.value);
            // var durasiCuti =
            //     "${fmt.format(dari.value)} - ${fmt.format(sampai.value)}";

            Get.back(result: {
              "dari": fmt.format(dari.value),
              "sampai": fmt.format(sampai.value)
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Submit",
                  style: style,
                ),
              ],
            ),
          )),
    );
  }

  void ubahPerpanjangan(
    String? idCutiOnline,
    value,
    String? tglMulaiCutiOnline,
    String? tglSelesaiCutiOnline,
    String? jenisCuti,
  ) async {
    print("$idCutiOnline");
    var res = await Constants().showAlert(
        judul: "Persetujuan",
        msg: "Apakah anda yakin untuk Mengubah Tanggal Cuti?",
        dismiss: true,
        fBtn: "Setujui",
        sBtn: "Tidak",
        del: true);
    if (res != null) {
      if (res) {
        postUpdatePerpanjanganCuti(idCutiOnline, value, tglMulaiCutiOnline,
            tglSelesaiCutiOnline, jenisCuti);
      }
    }
  }

  postUpdatePerpanjanganCuti(
    String? idCutiOnline,
    value,
    String? tglMulaiCutiOnline,
    String? tglSelesaiCutiOnline,
    String? jenisCuti,
  ) async {
    var dari = value['dari'];
    var sampai = value['sampai'];
    await provider
        .ubahTanggalPerpanjangan("${username.value}", "$idCutiOnline", dari,
            sampai, tglMulaiCutiOnline, tglSelesaiCutiOnline, jenisCuti)
        .then((value) {
      var success = value.success;

      if (success!) {
        Get.back();
        Get.snackbar("Berhasil", "Tanggal Perpanjangan Dirubah",
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        Get.back();
        Get.snackbar("Gagal", "Gagal Merubah Tanggal Perpanjangan, Coba Lagi!",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
      onRefresh();
    });
  }
}
