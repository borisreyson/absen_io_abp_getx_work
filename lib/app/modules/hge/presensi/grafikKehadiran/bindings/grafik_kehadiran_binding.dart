import 'package:get/get.dart';

import '../controllers/grafik_kehadiran_controller.dart';

class GrafikKehadiranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GrafikKehadiranController>(
      () => GrafikKehadiranController(),
    );
  }
}
