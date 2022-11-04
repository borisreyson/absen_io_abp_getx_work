import 'package:get/get.dart';

import '../controllers/kamera_controller.dart';

class KameraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KameraController>(
      () => KameraController(),
    );
  }
}
