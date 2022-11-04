import 'package:get/get.dart';

import '../controllers/rubah_bahaya_controller.dart';

class RubahBahayaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RubahBahayaController>(
      () => RubahBahayaController(),
    );
  }
}
