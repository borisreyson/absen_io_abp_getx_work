import 'package:get/get.dart';

import '../controllers/rubah_k_t_a_controller.dart';

class RubahKTABinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RubahKTAController>(
      () => RubahKTAController(),
    );
  }
}
