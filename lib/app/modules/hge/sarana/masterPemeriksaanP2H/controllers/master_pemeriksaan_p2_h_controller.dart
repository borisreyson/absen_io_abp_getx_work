import 'package:face_id_plus/app/data/providers/p2h_provider.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../data/models/master_pemeriksaan_model.dart';

class MasterPemeriksaanP2HController extends GetxController {
  final provider = P2hProvider();
  final page = 1.obs;
  final data = <MasterPemeriksaan>[].obs;
  final lastPage = 1.obs;
  final refreshController = RefreshController();
  final pullUp = true.obs;
  @override
  void onInit() {
    getPemeriksaan(page.value);
    super.onInit();
  }

  getPemeriksaan(hal) async {
    await provider.getPemeriksaan(hal).then((value) {
      var res = value.masterPemeriksaan;
      if (res != null) {
        var response = res.data;
        lastPage.value = res.lastPage!;
        print("${lastPage.value}");
        if (response != null) {
          data.addAll(response);
          refreshController.loadComplete();
          refreshController.refreshCompleted();
        }
      }
    });
  }

  void onRefresh() {
    data.clear();
    page.value = 1;
    getPemeriksaan(page.value);
  }

  void onLoading() {
    if (page.value <= lastPage.value) {
      page.value++;
      pullUp.value = true;
    } else {
      pullUp.value = false;
    }

    getPemeriksaan(page.value);
  }
}
