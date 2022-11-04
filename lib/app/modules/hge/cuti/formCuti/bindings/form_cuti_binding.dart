import 'package:get/get.dart';

import '../controllers/form_cuti_controller.dart';

class FormCutiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormCutiController>(
      () => FormCutiController(),
    );
  }
}
