import 'package:get/get.dart';

import '../controllers/pengendalian_controller.dart';

class PengendalianBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengendalianController>(
      () => PengendalianController(),
    );
  }
}
