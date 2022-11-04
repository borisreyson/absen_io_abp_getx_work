import 'package:get/get.dart';

import '../controllers/rkb_section_controller.dart';

class RkbSectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RkbSectionController>(
      () => RkbSectionController(),
    );
  }
}
