import 'package:get/get.dart';

import '../controllers/rkb_admin_controller.dart';

class RkbAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RkbAdminController>(
      () => RkbAdminController(),
    );
  }
}
