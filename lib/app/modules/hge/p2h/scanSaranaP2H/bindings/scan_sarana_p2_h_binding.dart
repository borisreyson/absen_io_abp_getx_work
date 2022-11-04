import 'package:get/get.dart';

import '../controllers/scan_sarana_p2_h_controller.dart';

class ScanSaranaP2HBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanSaranaP2HController>(
      () => ScanSaranaP2HController(),
    );
  }
}
