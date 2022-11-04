import 'package:get/get.dart';

import '../controllers/cuti_ke_atasan_controller.dart';

class CutiKeAtasanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CutiKeAtasanController>(
      () => CutiKeAtasanController(),
    );
  }
}
