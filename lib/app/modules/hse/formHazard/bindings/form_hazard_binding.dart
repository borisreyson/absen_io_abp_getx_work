import 'package:get/get.dart';

import '../controllers/form_hazard_controller.dart';

class FormHazardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormHazardController>(
      () => FormHazardController(),
    );
  }
}
