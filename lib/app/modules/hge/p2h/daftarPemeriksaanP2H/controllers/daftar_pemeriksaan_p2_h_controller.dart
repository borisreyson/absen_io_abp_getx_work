
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/models/master_pemeriksaan_model.dart';
import '../../../../../data/models/p2h_sarana_mode.dart';
import '../../../../../data/providers/p2h_provider.dart';
import '../../../../../data/services/service.dart';
import '../../../../../data/utils/constants.dart';

class DaftarPemeriksaanP2HController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final provider = P2hProvider();
  final service = P2HSaranaService();
  final serviceKondisi = P2HKondisiService();
  final serviceTemuan = P2HTemuanPemeriksaanService();
  final data = <MasterPemeriksaan>[].obs;
  final dataLokal = <MasterPemeriksaan>[].obs;
  final loaded = false.obs;
  final dataHeader = P2HSaranaModel().obs;
  final posisi = RxDouble(0);
  final idHeader = RxnInt(null);

  late final AnimationController animateController =
      AnimationController(duration: const Duration(seconds: 1), vsync: this)
        ..repeat(reverse: true);
  final menuOpen = true.obs;
  @override
  void onInit() async {
    var res = await Get.arguments['header'];
    if (res != null) {
      idHeader.value = res;
      getAllData();
    }
    super.onInit();
  }

  getAllData() async {
    data.clear();
    dataLokal.clear();
    await provider.getPemeriksaanAll().then((value) {
      var result = value.masterPemeriksaan;
      if (result != null) {
        data.addAll(result);
        dataLokal.addAll(result);
        getDataP2h();
      } else {
        loaded.value = false;
      }
    });
  }

  reloadData() async {
    data.clear();
    data.addAll(dataLokal);
    await getDataP2h();
  }

  getDataP2h() async {
    dataHeader.value = P2HSaranaModel();
    await service.getFirstId(idHeader: idHeader.value).then((value) {
      if (value != null) {
        dataHeader.value = value;
      }
      loaded.value = true;
    });
  }

  Future<bool> cekKondisi(idPemeriksaan, idHeader) {
    return serviceKondisi
        .getByIdDetail(idDetail: idPemeriksaan, idHeader: idHeader)
        .then((value) {
      if (value != null) {
        return true;
      } else {
        return false;
      }
    });
  }

  void selesaiP2h() async {
    Constants().showAlert(
      dismiss: false,
      loading: true,
      enBtn: false,
    );
    await service.getFirstId(idHeader: idHeader.value).then((value) async {
      var sHeader = value;
      await serviceKondisi
          .getByHeader(idHeader: "${sHeader?.idHeader}")
          .then((value) async {
        var p2hModels = P2HDataModels();
        p2hModels.saranaHeader = dataHeader.value;
        p2hModels.pemeriksaan = value;

        await provider.postDataP2h(p2hModels).then((v) async {
          if (v.success!) {
            await service.deletAll();
            await serviceKondisi.deletAll();
            await serviceTemuan.deletAll();
            Get.back();
            Get.back();
            Get.back();
            Get.back();
            Get.back(result: true);
          } else {
            Get.back();
            Get.back();
            Get.snackbar("Error", "Error Simpan Data Ke Server, Coba Lagi",
                colorText: Colors.white, backgroundColor: Colors.red);
          }
        });
      });
    });
  }

  @override
  void onClose() {
    animateController.dispose();
    super.onClose();
  }
}
