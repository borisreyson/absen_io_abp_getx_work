import 'package:get/get.dart';

import '../controllers/lokasi_mati_controller.dart';

class LokasiMatiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LokasiMatiController>(
      () => LokasiMatiController(),
    );
  }
}
