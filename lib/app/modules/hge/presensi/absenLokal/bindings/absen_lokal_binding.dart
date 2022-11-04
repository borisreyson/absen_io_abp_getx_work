import 'package:get/get.dart';

import '../controllers/absen_lokal_controller.dart';

class AbsenLokalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AbsenLokalController>(
      () => AbsenLokalController(),
    );
  }
}
