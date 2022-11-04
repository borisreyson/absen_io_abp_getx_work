import 'package:get/get.dart';

import '../controllers/rkb_dept_controller.dart';

class RkbDeptBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RkbDeptController>(
      () => RkbDeptController(),
    );
  }
}
