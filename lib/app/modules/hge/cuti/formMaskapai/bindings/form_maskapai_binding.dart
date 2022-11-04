import 'package:get/get.dart';

import '../controllers/form_maskapai_controller.dart';

class FormMaskapaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormMaskapaiController>(
      () => FormMaskapaiController(),
    );
  }
}
