import 'package:get/get.dart';

import '../controllers/lokasi_hazard_controller.dart';

class LokasiHazardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LokasiHazardController>(
      () => LokasiHazardController(),
    );
  }
}
