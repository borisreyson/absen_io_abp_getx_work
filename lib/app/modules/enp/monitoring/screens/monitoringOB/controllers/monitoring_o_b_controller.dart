import 'package:face_id_plus/app/data/models/model_ob.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../../data/provider.dart';

class MonitoringOBController extends GetxController {
  final provider = Provider();
  final dataOB = <DataOB>[].obs;
  final isLoading = true.obs;
  final page = 1.obs;
  final totalPage = 0.obs;
  final pullUp = true.obs;
  final refreshController = RefreshController().obs;
  final dariTgl = TextEditingController();
  final sampaiTgl = TextEditingController();
  final fmt = DateFormat('dd MMMM yyyy').obs;
  final dateTime = DateTime.now().obs;
  DateTime? tglFilter;
  DateTime? dari, sampai;
  DateTime tglAwal = DateTime.now();
  final f = NumberFormat("###,###.0#", "en_US").obs;

  @override
  void onInit() {
    tglFilter = dateTime.value;
    tglAwal = DateTime(dateTime.value.year, dateTime.value.month, 01);
    dari = tglAwal;
    sampai = dateTime.value;
    dataOB.value = [];
    dataOB.clear();
    fetchOb(
      page.value,
      fmt.value.format(dari!),
      fmt.value.format(sampai!),
    );
    super.onInit();
  }

  void onUpdate() {
    if (page.value < totalPage.value) {
      page.value++;
      fetchOb(
        page.value,
        fmt.value.format(dari!),
        fmt.value.format(sampai!),
      );
    } else {
      refreshController.value.refreshCompleted();
      refreshController.value.loadComplete();
    }
  }

  void onRefresh() {
    dataOB.clear();
    page.value = 1;
    fetchOb(
      page.value,
      fmt.value.format(dari!),
      fmt.value.format(sampai!),
    );
    Future.delayed(const Duration(seconds: 2), () {
      refreshController.value.refreshCompleted();
    });
  }

  fetchOb(int pages, String dari, String sampai) async {
    var load = provider.getOB(pages, dari, sampai);
    await load.then((value) {
      var berhasil = value.success;
      var ob = value.monitoringOb;
      if (berhasil!) {
        if (ob != null) {
          totalPage.value = ob.lastPage!;
          if (page.value == totalPage.value) {
            pullUp.value = false;
          } else {
            pullUp.value = true;
          }
          var apiData = ob.data;
          dataOB.addAll(apiData!);
        }
        refreshController.value.loadComplete();
        refreshController.value.refreshCompleted();
      }
    }).catchError((onError) {
      if (kDebugMode) {
        print(
          onError.toString(),
        );
      }
    }).whenComplete(() => isLoading.value = false);
  }
}
