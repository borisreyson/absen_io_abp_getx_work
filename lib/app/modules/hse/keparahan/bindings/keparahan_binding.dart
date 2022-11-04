import 'package:get/get.dart';

import '../controllers/keparahan_controller.dart';

class KeparahanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KeparahanController>(
      () => KeparahanController(),
    );
  }
}
