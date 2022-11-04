import 'package:get/get.dart';

import '../controllers/penimpanan_controller.dart';

class PenimpananBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PenimpananController>(
      () => PenimpananController(),
    );
  }
}
