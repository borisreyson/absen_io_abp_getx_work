import 'package:get/get.dart';

import '../controllers/detai_cuti_controller.dart';

class DetaiCutiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetaiCutiController>(
      () => DetaiCutiController(),
    );
  }
}
