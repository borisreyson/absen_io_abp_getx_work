import 'package:get/get.dart';

import '../controllers/view_image_controller.dart';

class ViewImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewImageController>(
      () => ViewImageController(),
    );
  }
}
