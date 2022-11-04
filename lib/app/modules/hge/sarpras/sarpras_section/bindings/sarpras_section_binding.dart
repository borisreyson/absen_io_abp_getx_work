import 'package:get/get.dart';

import '../controllers/sarpras_section_controller.dart';

class SarprasSectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SarprasSectionController>(
      () => SarprasSectionController(),
    );
  }
}
