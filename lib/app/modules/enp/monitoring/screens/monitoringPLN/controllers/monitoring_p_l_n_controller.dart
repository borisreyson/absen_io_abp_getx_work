import 'package:face_id_plus/app/data/models/model_pln.dart';
import 'package:face_id_plus/app/data/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MonitoringPLNController extends GetxController {
  final provider = Provider();
  final dataPLN = <DataPLN>[].obs;
  final isLoading = true.obs;
  final page = 1.obs;
  final totalPage = 0.obs;
  final pullUp = true.obs;
  final refreshController = RefreshController().obs;
  final dariTgl = TextEditingController();
  final sampaiTgl = TextEditingController();
  final fmt = DateFormat('dd MMMM yyyy').obs;
  final dateTime = DateTime.now().obs;
  final f = NumberFormat("###,###.0#", "en_US").obs;

  final count = 0.obs;
  @override
  void onInit() {
    dataPLN.value = [];
    dataPLN.clear();
    fetchPLN(
      page.value,
    );
    super.onInit();
  }

  void onUpdate() {
    if (page.value < totalPage.value) {
      page.value++;
      fetchPLN(
        page.value,
      );
    } else {
      refreshController.value.refreshCompleted();
      refreshController.value.loadComplete();
    }
  }

  void onRefresh() {
    dataPLN.clear();
    page.value = 1;
    fetchPLN(
      page.value,
    );
    Future.delayed(const Duration(seconds: 2), () {
      refreshController.value.refreshCompleted();
    });
  }

  fetchPLN(int pages) async {
    var load = provider.getPLN(pages);
    await load.then((value) {
      // ignore: unnecessary_null_comparison
      if (value != null) {
        var berhasil = value.success;
        var ob = value.monitoringPLN;
        if (berhasil!) {
          if (ob != null) {
            totalPage.value = ob.lastPage!;
            if (page.value == totalPage.value) {
              pullUp.value = false;
            } else {
              pullUp.value = true;
            }
            var apiData = ob.data;
            dataPLN.addAll(apiData!);
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
