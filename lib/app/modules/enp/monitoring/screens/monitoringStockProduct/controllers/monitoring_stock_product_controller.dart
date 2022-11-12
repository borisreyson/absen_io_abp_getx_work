// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../../data/models/model_stock.dart';
import '../../../../../../data/provider.dart';

class MonitoringStockProductController extends GetxController {
  final provider = Provider();
  final dataStockRom = <DataStock>[].obs;
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
    dataStockRom.value = [];
    dataStockRom.clear();
    fetchStockRom(
      page.value,
      fmt.value.format(dari!),
      fmt.value.format(sampai!),
    );
    super.onInit();
  }

  void onUpdate() {
    if (page.value < totalPage.value) {
      page.value++;
      fetchStockRom(
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
    dataStockRom.clear();
    page.value = 1;
    fetchStockRom(
      page.value,
      fmt.value.format(dari!),
      fmt.value.format(sampai!),
    );
    Future.delayed(const Duration(seconds: 2), () {
      refreshController.value.refreshCompleted();
    });
  }

  fetchStockRom(int pages, String dari, String sampai) async {
    var load = provider.getStock(pages, dari, sampai);
    await load.then((value) {
      if (value != null) {
        var berhasil = value.success;
        // ignore: non_constant_identifier_names
        var StockRom = value.monitoringStock;
        if (berhasil!) {
          if (StockRom != null) {
            totalPage.value = StockRom.lastPage!;
            if (page.value == totalPage.value) {
              pullUp.value = false;
            } else {
              pullUp.value = true;
            }
            var apiData = StockRom.data;
            dataStockRom.addAll(apiData!);
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
