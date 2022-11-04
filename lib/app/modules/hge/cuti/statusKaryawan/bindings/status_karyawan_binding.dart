import 'package:get/get.dart';

import '../controllers/status_karyawan_controller.dart';

class StatusKaryawanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatusKaryawanController>(
      () => StatusKaryawanController(),
    );
  }
}
