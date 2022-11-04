import 'package:face_id_plus/app/data/models/listSaranaHeader.dart';
import 'package:face_id_plus/app/data/providers/sarana_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListSaranaController extends GetxController {
  final saranaProvider = SaranaProvider();
  final listSarana = <Data>[].obs;
  final page = 1.obs;
  final refreshController = RefreshController();
  final pullUp = true.obs;
  final lastPage = 1.obs;
  @override
  void onInit() {
    getSarana(page.value);
    super.onInit();
  }

  getSarana(int? hal) async {
    saranaProvider.getSarana(hal).then((value) {
      if (value != null) {
        var res = value.unitSarana;
        if (res != null) {
          lastPage.value = res.lastPage!;
          listSarana.addAll(res.data!);
        }
      }
    }).whenComplete(() {
      refreshController.loadComplete();
      refreshController.refreshCompleted();
    });
  }

  void onLoading() {
    if (page.value < lastPage.value) {
      page.value++;
      pullUp.value = true;
      getSarana(page.value);
    } else {
      pullUp.value = false;
    }
  }

  void onRefresh() {
    listSarana.clear();
    page.value = 1;
    pullUp.value = true;

    getSarana(page.value);
  }

  void enDis(String? no, int flag) async {
    await saranaProvider.endDisSarana(no, "$flag").then((value) {
      if (value != null) {
        var success = value.success;
        if (success!) {
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
    }).whenComplete(() => onRefresh());
  }
}
