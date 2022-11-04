import 'package:get/get.dart';

import '../controllers/hazard_p_j_controller.dart';

class HazardPJBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HazardPJController>(
      () => HazardPJController(),
    );
  }
}
