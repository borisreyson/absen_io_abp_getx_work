import 'package:get/get.dart';

import '../controllers/ganti_sandi_controller.dart';

class GantiSandiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GantiSandiController>(
      () => GantiSandiController(),
    );
  }
}
