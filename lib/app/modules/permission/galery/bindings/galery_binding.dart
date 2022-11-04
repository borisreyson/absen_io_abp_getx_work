import 'package:get/get.dart';

import '../controllers/galery_controller.dart';

class GaleryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GaleryController>(
      () => GaleryController(),
    );
  }
}
