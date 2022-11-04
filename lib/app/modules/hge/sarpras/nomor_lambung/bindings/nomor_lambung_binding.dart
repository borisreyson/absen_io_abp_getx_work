import 'package:get/get.dart';

import '../controllers/nomor_lambung_controller.dart';

class NomorLambungBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NomorLambungController>(
      () => NomorLambungController(),
    );
  }
}
