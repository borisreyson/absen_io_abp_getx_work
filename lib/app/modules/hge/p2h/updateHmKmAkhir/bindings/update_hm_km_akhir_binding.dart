import 'package:get/get.dart';

import '../controllers/update_hm_km_akhir_controller.dart';

class UpdateHmKmAkhirBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateHmKmAkhirController>(
      () => UpdateHmKmAkhirController(),
    );
  }
}
