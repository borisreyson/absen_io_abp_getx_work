import 'package:get/get.dart';

import '../controllers/sarpras_kabag_controller.dart';

class SarprasKabagBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SarprasKabagController>(
      () => SarprasKabagController(),
    );
  }
}
