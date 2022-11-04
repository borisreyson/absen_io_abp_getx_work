import 'package:get/get.dart';

import '../controllers/monitoring_tugboat_controller.dart';

class MonitoringTugboatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MonitoringTugboatController>(
      () => MonitoringTugboatController(),
    );
  }
}
