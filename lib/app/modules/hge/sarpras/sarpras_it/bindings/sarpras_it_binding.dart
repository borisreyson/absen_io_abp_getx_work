import 'package:get/get.dart';

import '../controllers/sarpras_it_controller.dart';

class SarprasItBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SarprasItController>(
      () => SarprasItController(),
    );
  }
}
