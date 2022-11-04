import 'package:get/get.dart';

import '../controllers/ganti_foto_controller.dart';

class GantiFotoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GantiFotoController>(
      () => GantiFotoController(),
    );
  }
}
