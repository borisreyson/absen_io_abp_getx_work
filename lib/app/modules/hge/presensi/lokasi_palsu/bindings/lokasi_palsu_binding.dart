import 'package:get/get.dart';

import '../controllers/lokasi_palsu_controller.dart';

class LokasiPalsuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LokasiPalsuController>(
      () => LokasiPalsuController(),
    );
  }
}
