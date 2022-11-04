import 'package:get/get.dart';

import '../controllers/qr_menu_controller.dart';

class QrMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrMenuController>(
      () => QrMenuController(),
    );
  }
}
