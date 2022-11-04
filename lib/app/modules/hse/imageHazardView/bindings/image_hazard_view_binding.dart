import 'package:get/get.dart';

import '../controllers/image_hazard_view_controller.dart';

class ImageHazardViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImageHazardViewController>(
      () => ImageHazardViewController(),
    );
  }
}
