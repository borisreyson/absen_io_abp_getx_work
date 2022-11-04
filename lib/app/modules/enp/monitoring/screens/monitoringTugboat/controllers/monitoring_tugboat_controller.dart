import 'package:face_id_plus/app/data/models/model_tugboat.dart';
import 'package:face_id_plus/app/data/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MonitoringTugboatController extends GetxController {
  final provider = Provider();
  final dataTugboat = <DataTugboat>[].obs;
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

  final count = 0.obs;
  @override
  void onInit() {
    tglFilter = dateTime.value;
    tglAwal = DateTime(dateTime.value.year, dateTime.value.month, 01);
    dari = tglAwal;
    sampai = dateTime.value;
    dataTugboat.value = [];
    dataTugboat.clear();
    fetchTugboat(
      page.value,
      fmt.value.format(dari!),
      fmt.value.format(sampai!),
    );
    super.onInit();
  }

  void onUpdate() {
    if (page.value < totalPage.value) {
      page.value++;
      fetchTugboat(
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
    dataTugboat.clear();
    page.value = 1;
    fetchTugboat(
      page.value,
      fmt.value.format(dari!),
      fmt.value.format(sampai!),
    );
    Future.delayed(const Duration(seconds: 2), () {
      refreshController.value.refreshCompleted();
    });
  }

  fetchTugboat(int pages, String dari, String sampai) async {
    var load = provider.getTugboat(pages, dari, sampai);
    await load.then((value) {
      if (value != null) {
        var berhasil = value.success;
        var ob = value.monitoringTugboat;
        if (berhasil!) {
          if (ob != null) {
            totalPage.value = ob.lastPage!;
            if (page.value == totalPage.value) {
              pullUp.value = false;
            } else {
              pullUp.value = true;
            }
            var apiData = ob.data;
            dataTugboat.addAll(apiData!);
          }
          refreshController.value.loadComplete();
          refreshController.value.refreshCompleted();
        }
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
