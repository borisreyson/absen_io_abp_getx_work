import 'package:get/get.dart';

import '../controllers/cuti_ke_dept_head_controller.dart';

class CutiKeDeptHeadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CutiKeDeptHeadController>(
      () => CutiKeDeptHeadController(),
    );
  }
}
