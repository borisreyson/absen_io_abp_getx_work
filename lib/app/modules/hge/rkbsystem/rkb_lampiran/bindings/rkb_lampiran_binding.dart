import 'package:get/get.dart';

import '../controllers/rkb_lampiran_controller.dart';

class RkbLampiranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RkbLampiranController>(
      () => RkbLampiranController(),
    );
  }
}
