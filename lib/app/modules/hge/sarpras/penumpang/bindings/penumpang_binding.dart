import 'package:get/get.dart';

import '../controllers/penumpang_controller.dart';

class PenumpangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PenumpangController>(
      () => PenumpangController(),
    );
  }
}
