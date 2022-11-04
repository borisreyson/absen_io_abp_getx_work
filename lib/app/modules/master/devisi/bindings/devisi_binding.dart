import 'package:get/get.dart';

import '../controllers/devisi_controller.dart';

class DevisiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DevisiController>(
      () => DevisiController(),
    );
  }
}
