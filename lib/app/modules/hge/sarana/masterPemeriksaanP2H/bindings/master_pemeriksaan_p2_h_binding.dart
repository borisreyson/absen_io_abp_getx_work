import 'package:get/get.dart';

import '../controllers/master_pemeriksaan_p2_h_controller.dart';

class MasterPemeriksaanP2HBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MasterPemeriksaanP2HController>(
      () => MasterPemeriksaanP2HController(),
    );
  }
}
