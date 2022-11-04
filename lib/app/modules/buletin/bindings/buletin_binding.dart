import 'package:get/get.dart';

import '../controllers/buletin_controller.dart';

class BuletinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuletinController>(
      () => BuletinController(),
    );
  }
}
