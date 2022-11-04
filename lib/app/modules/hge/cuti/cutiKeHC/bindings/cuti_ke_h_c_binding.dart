import 'package:get/get.dart';

import '../controllers/cuti_ke_h_c_controller.dart';

class CutiKeHCBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CutiKeHCController>(
      () => CutiKeHCController(),
    );
  }
}
