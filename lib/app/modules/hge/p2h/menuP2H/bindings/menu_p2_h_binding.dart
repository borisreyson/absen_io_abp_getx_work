import 'package:get/get.dart';

import '../controllers/menu_p2_h_controller.dart';

class MenuP2HBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuP2HController>(
      () => MenuP2HController(),
    );
  }
}
