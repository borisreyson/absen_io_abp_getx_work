import 'package:get/get.dart';

import '../controllers/detail_absensi_controller.dart';

class DetailAbsensiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailAbsensiController>(
      () => DetailAbsensiController(),
    );
  }
}
