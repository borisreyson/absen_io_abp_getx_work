import 'package:get/get.dart';

import '../controllers/monitoring_hauling_delay_controller.dart';

class MonitoringHaulingDelayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MonitoringHaulingDelayController>(
      () => MonitoringHaulingDelayController(),
    );
  }
}
