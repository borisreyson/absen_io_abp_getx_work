import 'package:get/get.dart';

import '../controllers/rubah_sarana_controller.dart';

class RubahSaranaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RubahSaranaController>(
      () => RubahSaranaController(),
    );
  }
}
