import 'package:face_id_plus/app/data/models/rkb_models.dart';
import 'package:face_id_plus/app/data/providers/provider.dart';
import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RkbController extends GetxController {
  final provider = Provider();
  final status = RxnString(null);
  final nik = RxnString(null);
  final nama = RxnString(null);
  final section = RxnString(null);
  final dept = RxnString(null);
  final perusahaan = RxnString(null);
  final username = RxnString(null);
  final page = 1.obs;
  final data = <Data>[].obs;
  final refreshController = RefreshController();
  final pullUp = true.obs;
  final lastPage = 1.obs;

  final listOption = ["ALL", "Waiting", "Approved", "Canceled", "Closed"];
  final indexSelect = RxnInt(null);
  final listColor = [
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.red,
    Colors.red
  ];
  @override
  void onInit() async {
    status.value = await Get.arguments['status'];
    indexSelect.value = await Get.arguments['index'];
    getPref();
    super.onInit();
  }

  getPref() async {
    var pref = await SharedPreferences.getInstance();
    nik.value = pref.getString(Constants.nik);
    nama.value = pref.getString(Constants.name);
    section.value = pref.getString(Constants.section);
    dept.value = pref.getString(Constants.departement);
    perusahaan.value = pref.getString(Constants.company);
    username.value = pref.getString(Constants.username);
    getRkb();
  }

  getRkb() async {
    await provider
        .getRkbUser(username.value, "${page.value}", "${status.value}")
        .then((value) {
      // ignore: unnecessary_null_comparison
      if (value != null) {
        if (kDebugMode) {
          print("a");
        }
        var rkb = value.rkb;
        if (rkb != null) {
          if (kDebugMode) {
            print("b");
          }
          lastPage.value = rkb.lastPage!;
          if (rkb.data!.isNotEmpty) {
            if (kDebugMode) {
              print("c");
            }
            data.addAll(rkb.data!);
          }
          refreshController.refreshCompleted();
          refreshController.loadComplete();
        }
      } else {
        refreshController.refreshCompleted();
        refreshController.loadComplete();
      }
    });
  }

  void onRefresh() {
    page.value = 0;
    data.clear();
    getRkb();
  }

  void loadMore() async {
    if (page.value < lastPage.value) {
      page.value++;
      if (kDebugMode) {
        print("page ${page.value}");
      }

      await getRkb();
    } else {
      refreshController.loadComplete();
      refreshController.refreshCompleted();
      pullUp.value = false;
    }
  }

  tapNavigasi(index) async {
    page.value = 1;
    data.clear();
    status.value = listOption.elementAt(index);
    indexSelect.value = index;
    getRkb();
  }
}
