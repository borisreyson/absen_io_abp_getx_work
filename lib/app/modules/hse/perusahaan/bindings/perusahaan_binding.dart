import 'package:get/get.dart';

import '../controllers/perusahaan_controller.dart';

class PerusahaanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PerusahaanController>(
      () => PerusahaanController(),
    );
  }
}
