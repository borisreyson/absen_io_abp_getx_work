import 'package:face_id_plus/app/data/models/data_karayawan.dart';
import 'package:face_id_plus/app/data/providers/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListKaryawanController extends GetxController {
  final provider = Provider();
  final karyawan = <Data>[].obs;
  final curPage = RxnInt(1);
  final lastPage = RxnInt(1);
  final halaman = 1.obs;
  final refreshController = RefreshController();
  final enPullUp = true.obs;
  Widget? searchBar = const Text("Karyawan");
  final cari = false.obs;
  final cariFocus = FocusNode();
  final cariController = TextEditingController();
  @override
  void onInit() async {
    karyawan.clear;
    halaman.value = 1;
    getKaryawan(halaman.value);
    super.onInit();
  }

  getKaryawan(int? hal, {String? cari}) async {
    await provider.getKaryawan(hal, cari: cari).then((value) {
      if (kDebugMode) {
        print("value $value");
      }
      var res = value.dataKaryawan;
      var dataKaryawan = res;
      if (dataKaryawan != null) {
        curPage.value = dataKaryawan.currentPage;
        lastPage.value = dataKaryawan.lastPage;
        if (dataKaryawan.data != null) {
          karyawan.addAll(dataKaryawan.data!);
        }
        refreshController.loadComplete();
        refreshController.refreshCompleted();
      }
    });
  }

  void onLoading() {
    if (curPage.value! <= lastPage.value!) {
      enPullUp.value = true;
      halaman.value++;
    } else {
      enPullUp.value = false;
    }
    getKaryawan(halaman.value);
  }

  void onRefresh() {
    enPullUp.value = true;
    karyawan.clear();
    halaman.value = 1;
    getKaryawan(halaman.value);
  }

  cariUser(String? cari) async {
    karyawan.clear();
    halaman.value = 1;
    if (cari != null) {
      getKaryawan(halaman.value, cari: cari);
    } else {
      getKaryawan(halaman.value);
    }
  }
}
