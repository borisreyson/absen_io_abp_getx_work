import 'package:get/get.dart';

import '../controllers/status_keluarga_controller.dart';

class StatusKeluargaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatusKeluargaController>(
      () => StatusKeluargaController(),
    );
  }
}
