import 'package:get/get.dart';

import '../controllers/sarpras_security_controller.dart';

class SarprasSecurityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SarprasSecurityController>(
      () => SarprasSecurityController(),
    );
  }
}
