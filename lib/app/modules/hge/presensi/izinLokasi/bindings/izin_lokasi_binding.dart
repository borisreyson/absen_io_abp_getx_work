import 'package:get/get.dart';

import '../controllers/izin_lokasi_controller.dart';

class IzinLokasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IzinLokasiController>(
      () => IzinLokasiController(),
    );
  }
}
