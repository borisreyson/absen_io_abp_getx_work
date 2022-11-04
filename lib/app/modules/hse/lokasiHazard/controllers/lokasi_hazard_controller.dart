import 'package:face_id_plus/app/data/models/lokasi_model.dart';
import 'package:face_id_plus/app/data/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../data/repository/repository_sqlite.dart';

class LokasiHazardController extends GetxController {
  final repository = ReporsitoryLokasi();
  final data = <Lokasi>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() async {
    await repository.getAll(table: Constants.lokasiTb).then((result) {
      for (var element in result) {
        if (kDebugMode) {
          print("element ${element.desLokasi}");
        }
        data.add(element);
      }
    }).whenComplete(() => isLoading.value = false);
    super.onInit();
  }


  @override
  void onClose() {}
}
