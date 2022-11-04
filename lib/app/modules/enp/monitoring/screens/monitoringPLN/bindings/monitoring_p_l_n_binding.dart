import 'package:get/get.dart';

import '../controllers/monitoring_p_l_n_controller.dart';

class MonitoringPLNBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MonitoringPLNController>(
      () => MonitoringPLNController(),
    );
  }
}
