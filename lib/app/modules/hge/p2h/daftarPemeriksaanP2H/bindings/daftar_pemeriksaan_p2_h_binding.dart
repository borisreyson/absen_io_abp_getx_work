import 'package:get/get.dart';

import '../controllers/daftar_pemeriksaan_p2_h_controller.dart';

class DaftarPemeriksaanP2HBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarPemeriksaanP2HController>(
      () => DaftarPemeriksaanP2HController(),
    );
  }
}
