import 'package:get/get.dart';

import '../controllers/kemungkinan_controller.dart';

class KemungkinanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KemungkinanController>(
      () => KemungkinanController(),
    );
  }
}
