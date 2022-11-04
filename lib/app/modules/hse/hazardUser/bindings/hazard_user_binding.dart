import 'package:get/get.dart';

import '../controllers/hazard_user_controller.dart';

class HazardUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HazardUserController>(
      () => HazardUserController(),
    );
  }
}
