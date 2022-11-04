import 'package:get/get.dart';

import '../controllers/absen_pulang_controller.dart';

class AbsenPulangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AbsenPulangController>(
      () => AbsenPulangController(),
    );
  }
}
