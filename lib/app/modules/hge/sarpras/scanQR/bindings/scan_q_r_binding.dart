import 'package:get/get.dart';

import '../controllers/scan_q_r_controller.dart';

class ScanQRBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanQRController>(
      () => ScanQRController(),
    );
  }
}
