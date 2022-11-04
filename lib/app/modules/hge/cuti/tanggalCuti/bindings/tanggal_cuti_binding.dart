import 'package:get/get.dart';

import '../controllers/tanggal_cuti_controller.dart';

class TanggalCutiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TanggalCutiController>(
      () => TanggalCutiController(),
    );
  }
}
