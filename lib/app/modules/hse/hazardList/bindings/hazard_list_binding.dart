import 'package:get/get.dart';

import '../controllers/hazard_list_controller.dart';

class HazardListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HazardListController>(
      () => HazardListController(),
    );
  }
}
