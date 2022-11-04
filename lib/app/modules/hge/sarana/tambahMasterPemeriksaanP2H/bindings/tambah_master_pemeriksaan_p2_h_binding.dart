import 'package:get/get.dart';

import '../controllers/tambah_master_pemeriksaan_p2_h_controller.dart';

class TambahMasterPemeriksaanP2HBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahMasterPemeriksaanP2HController>(
      () => TambahMasterPemeriksaanP2HController(),
    );
  }
}
