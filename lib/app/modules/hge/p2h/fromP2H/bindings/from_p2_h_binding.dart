import 'package:get/get.dart';

import '../controllers/from_p2_h_controller.dart';

class FromP2HBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FromP2HController>(
      () => FromP2HController(),
    );
  }
}
