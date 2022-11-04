import 'package:get/get.dart';

import '../controllers/main_absen_controller.dart';

class MainAbsenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainAbsenController>(
      () => MainAbsenController(),
    );
  }
}
