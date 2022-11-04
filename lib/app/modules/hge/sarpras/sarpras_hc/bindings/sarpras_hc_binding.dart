import 'package:get/get.dart';

import '../controllers/sarpras_hc_controller.dart';

class SarprasHcBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SarprasHcController>(
      () => SarprasHcController(),
    );
  }
}
