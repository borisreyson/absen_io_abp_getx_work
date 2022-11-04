import 'package:get/get.dart';

import '../controllers/absensi_v_p_s_controller.dart';

class AbsensiVPSBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AbsensiVPSController>(
      () => AbsensiVPSController(),
    );
  }
}
