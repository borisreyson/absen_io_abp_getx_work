import 'package:get/get.dart';

import '../controllers/cuti_ke_k_t_t_controller.dart';

class CutiKeKTTBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CutiKeKTTController>(
      () => CutiKeKTTController(),
    );
  }
}
