import 'package:get/get.dart';

import '../controllers/jenis_cuti_controller.dart';

class JenisCutiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JenisCutiController>(
      () => JenisCutiController(),
    );
  }
}
