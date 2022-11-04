import 'package:get/get.dart';

import '../controllers/rubah_master_pemeriksaan_p2_h_controller.dart';

class RubahMasterPemeriksaanP2HBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RubahMasterPemeriksaanP2HController>(
      () => RubahMasterPemeriksaanP2HController(),
    );
  }
}
