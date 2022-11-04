import 'package:get/get.dart';

import '../controllers/monitoring_ob_dlay_controller.dart';

class MonitoringObDlayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MonitoringObDlayController>(
      () => MonitoringObDlayController(),
    );
  }
}
