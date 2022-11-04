import 'package:get/get.dart';

import '../controllers/rubah_data_controller.dart';

class RubahDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RubahDataController>(
      () => RubahDataController(),
    );
  }
}
