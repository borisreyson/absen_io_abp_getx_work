import 'package:get/get.dart';

import '../controllers/detail_master_pemeriksaan_p2_h_controller.dart';

class DetailMasterPemeriksaanP2HBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailMasterPemeriksaanP2HController>(
      () => DetailMasterPemeriksaanP2HController(),
    );
  }
}
