import 'package:get/get.dart';

import '../controllers/monitoring_o_b_controller.dart';

class MonitoringOBBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MonitoringOBController>(
      () => MonitoringOBController(),
    );
  }
}
