import 'package:get/get.dart';

import '../controllers/monitoring_barging_controller.dart';

class MonitoringBargingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MonitoringBargingController>(
      () => MonitoringBargingController(),
    );
  }
}
