import 'package:get/get.dart';

import '../controllers/p2h_controller.dart';

class P2hBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<P2hController>(
      () => P2hController(),
    );
  }
}
