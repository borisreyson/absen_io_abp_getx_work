import 'package:get/get.dart';

import '../controllers/rkb_purchasing_controller.dart';

class RkbPurchasingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RkbPurchasingController>(
      () => RkbPurchasingController(),
    );
  }
}
