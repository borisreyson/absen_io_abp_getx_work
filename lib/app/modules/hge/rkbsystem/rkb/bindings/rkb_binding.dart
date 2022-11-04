import 'package:get/get.dart';

import '../controllers/rkb_controller.dart';

class RkbBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RkbController>(
      () => RkbController(),
    );
  }
}
