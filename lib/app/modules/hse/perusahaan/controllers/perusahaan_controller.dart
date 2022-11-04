import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../data/models/perusahaan_model.dart';
import '../../../../data/repository/repository_sqlite.dart';
import '../../../../data/utils/constants.dart';

class PerusahaanController extends GetxController {
  final repository = ReporsitoryPerusahaan();
  final data = (List<Company>.of([])).obs();
  final isLoading = true.obs;
  @override
  void onInit() async {
    await repository.getAll(table: Constants.perusahaanTb).then((result) {
      for (var element in result) {
        if (kDebugMode) {
          print("result ${element.namaPerusahaan}");
        }

        data.add(element);
      }
    }).whenComplete(() => isLoading.value = false);
    super.onInit();
  }


  @override
  void onClose() {}
}
