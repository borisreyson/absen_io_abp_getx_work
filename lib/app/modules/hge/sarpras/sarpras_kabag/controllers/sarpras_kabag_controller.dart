import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../data/models/sarana_models.dart';
import '../../../../../data/models/sarpras_list.dart';
import '../../../../../data/providers/provider.dart';
import '../../../../../data/utils/constants.dart';

class SarprasKabagController extends GetxController {
  final provider = Provider();
  final listSarpras = <Data>[].obs;
  final fmt = DateFormat('dd MMMM yyyy');
  final jam = DateFormat("HH:mm:ss");
  final refreshCtrl = RefreshController();
  final pullUp = true.obs;
  final page = 1.obs;
  var lastPage = 1;
  final isLoading = false.obs;
  int toIndex = 0;
  final username = RxnString(null);
  DateTime waktuSekarang = DateTime.now();
  final approveVisible = true.obs;
  final dept = RxnString(null);
  @override
  void onInit() async {
    getPref();

    super.onInit();
  }

  getSarpras(hal) async {
    await provider.getSarprasKabagSect("$hal", dept.value).then((value) {
      if (value != null) {
        print("sarpras $value");
        var sarpras = value.sarpras;
        if (sarpras != null) {
          lastPage = sarpras.lastPage!;
          if (page == lastPage) {
            pullUp.value = false;
          } else {
            pullUp.value = true;
          }
          if (kDebugMode) {
            print("halaman2 : $page : $lastPage");
          }
          if (sarpras.to != null) {
            toIndex = sarpras.to!;
          }
          var data = sarpras.data;

          if (data != null) {
            listSarpras.addAll(data);
          }
        }
      }
    }).whenComplete(() {
      refreshCtrl.refreshCompleted();
      refreshCtrl.loadComplete();
    }).onError((error, stackTrace) {
      refreshCtrl.refreshCompleted();
      refreshCtrl.loadComplete();
    });
  }

  void onRefresh() {
    listSarpras.clear();
    page.value = 1;
    getSarpras(page.value);
  }

  void onLoading() async {
    if (page < lastPage) {
      isLoading.value = true;
      page.value++;
      await provider.getSarprasKabagSect("$page", dept.value).then((value) {
        if (value != null) {
          print("sarpras $value");
          var sarpras = value.sarpras;
          if (sarpras != null) {
            lastPage = sarpras.lastPage!;
            if (page == lastPage) {
              pullUp.value = false;
            } else {
              pullUp.value = true;
            }
            if (kDebugMode) {
              print("halaman2 : $page : $lastPage");
            }
            if (sarpras.to != null) {
              toIndex = sarpras.to!;
            }
            var data = sarpras.data;
            if (data != null) {
              for (var element in data) {
                listSarpras.add(element);
              }
              refreshCtrl.refreshCompleted();
              refreshCtrl.loadComplete();
            }
          }
        }
      });
    } else {
      refreshCtrl.refreshCompleted();
      refreshCtrl.loadComplete();
      if (page == lastPage) {
        pullUp.value = false;
      } else {
        pullUp.value = true;
      }
    }
  }

  getPref() async {
    var pref = await SharedPreferences.getInstance();
    username.value = pref.getString(Constants.username);
    dept.value = pref.getString(Constants.departement);
    getSarpras(page.value);
  }

  void approveSarpras(ApproveSarana body) async {
    await provider.approveSarana(body).then((value) {
      if (value != null) {
        if (value.success!) {
          onRefresh();
          Get.snackbar("Berhasil", "Surat Izin Telah Di Approve");
        } else {
          Get.snackbar("Gagal", "Surat Izin Gagal Di Approve");
        }
      } else {
        Get.snackbar("Gagal", "Surat Izin Gagal Di Approve");
      }
    });
  }

  startTimer(sisa) {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (sisa == 0) {
          timer.cancel();
        } else {
          sisa--;
        }
      },
    );
    return sisa;
  }
}
