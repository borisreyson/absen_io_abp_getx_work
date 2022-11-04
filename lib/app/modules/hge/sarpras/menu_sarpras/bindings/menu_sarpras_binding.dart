import 'package:get/get.dart';

import '../controllers/menu_sarpras_controller.dart';

class MenuSarprasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuSarprasController>(
      () => MenuSarprasController(),
    );
  }
}
