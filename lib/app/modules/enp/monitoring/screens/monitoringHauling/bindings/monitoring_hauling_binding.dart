import 'package:get/get.dart';

import '../controllers/monitoring_hauling_controller.dart';

class MonitoringHaulingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MonitoringHaulingController>(
      () => MonitoringHaulingController(),
    );
  }
}
