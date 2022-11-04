import 'package:get/get.dart';

import '../controllers/monitoring_crushing_controller.dart';

class MonitoringCrushingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MonitoringCrushingController>(
      () => MonitoringCrushingController(),
    );
  }
}
