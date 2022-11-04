import 'package:face_id_plus/app/data/models/model_crushing.dart';
import 'package:face_id_plus/app/data/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class MonitoringCrushingController extends GetxController {
  final provider = Provider();
  final dataCrushing = <DataCrushing>[].obs;
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
    dataCrushing.value = [];
    dataCrushing.clear();
    fetchCrushing(
      page.value,
      fmt.value.format(dari!),
      fmt.value.format(sampai!),
    );
    super.onInit();
  }

  void onUpdate() {
    if (page.value < totalPage.value) {
      page.value++;
      fetchCrushing(
        page.value,
        fmt.value.format(dari!),
        fmt.value.format(sampai!),
      );
    } else {
      refreshController.value.refreshCompleted();
      refreshController.value.loadComplete();
      pullUp.value = false;
    }
  }

  void onRefresh() {
    dataCrushing.clear();
    page.value = 1;
    fetchCrushing(
      page.value,
      fmt.value.format(dari!),
      fmt.value.format(sampai!),
    );
    Future.delayed(const Duration(seconds: 2), () {
      refreshController.value.refreshCompleted();
    });
  }

  fetchCrushing(int pages, String dari, String sampai) async {
    var load = provider.getCrushing(pages, dari, sampai);
    await load.then((value) {
      // ignore: unnecessary_null_comparison
      if (value != null) {
        var berhasil = value.success;
        // ignore: non_constant_identifier_names
        var Crushing = value.monitoringCrushing;
        if (berhasil!) {
          if (Crushing != null) {
            totalPage.value = Crushing.lastPage!;
            if (page.value == totalPage.value) {
              pullUp.value = false;
            } else {
              pullUp.value = true;
            }
            var apiData = Crushing.data;
            dataCrushing.addAll(apiData!);
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
