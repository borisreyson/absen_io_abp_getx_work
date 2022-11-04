import 'package:get/get.dart';

import '../controllers/absen_masuk_controller.dart';

class AbsenMasukBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AbsenMasukController>(
      () => AbsenMasukController(),
    );
  }
}
