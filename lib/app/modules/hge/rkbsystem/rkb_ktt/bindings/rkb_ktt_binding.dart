import 'package:get/get.dart';

import '../controllers/rkb_ktt_controller.dart';

class RkbKttBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RkbKttController>(
      () => RkbKttController(),
    );
  }
}
