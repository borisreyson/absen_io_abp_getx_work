import 'package:get/get.dart';

import '../controllers/rubah_status_controller.dart';

class RubahStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RubahStatusController>(
      () => RubahStatusController(),
    );
  }
}
