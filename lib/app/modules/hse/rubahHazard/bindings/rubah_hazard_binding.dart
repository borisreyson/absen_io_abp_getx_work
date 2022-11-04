import 'package:get/get.dart';

import '../controllers/rubah_hazard_controller.dart';

class RubahHazardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RubahHazardController>(
      () => RubahHazardController(),
    );
  }
}
