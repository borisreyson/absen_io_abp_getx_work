import 'package:get/get.dart';

import '../controllers/menu_abp_controller.dart';

class MenuAbpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuAbpController>(
      () => MenuAbpController(),
    );
  }
}
