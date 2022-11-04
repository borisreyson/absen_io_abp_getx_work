import 'package:get/get.dart';

import '../controllers/sarana_controller.dart';

class SaranaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SaranaController>(
      () => SaranaController(),
    );
  }
}
