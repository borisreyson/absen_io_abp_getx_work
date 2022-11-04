import 'package:get/get.dart';

import '../controllers/ganti_sandi_form_controller.dart';

class GantiSandiFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GantiSandiFormController>(
      () => GantiSandiFormController(),
    );
  }
}
