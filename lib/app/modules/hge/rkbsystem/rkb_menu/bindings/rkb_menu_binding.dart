import 'package:get/get.dart';

import '../controllers/rkb_menu_controller.dart';

class RkbMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RkbMenuController>(
      () => RkbMenuController(),
    );
  }
}
