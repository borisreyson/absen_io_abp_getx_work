import 'package:get/get.dart';

import '../controllers/sarpras_kordinator_controller.dart';

class SarprasKordinatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SarprasKordinatorController>(
      () => SarprasKordinatorController(),
    );
  }
}
