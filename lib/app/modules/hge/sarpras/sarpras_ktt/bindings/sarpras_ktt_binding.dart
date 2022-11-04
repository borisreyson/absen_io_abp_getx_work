import 'package:get/get.dart';

import '../controllers/sarpras_ktt_controller.dart';

class SarprasKttBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SarprasKttController>(
      () => SarprasKttController(),
    );
  }
}
