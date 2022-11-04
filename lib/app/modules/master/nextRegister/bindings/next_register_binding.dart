import 'package:get/get.dart';

import '../controllers/next_register_controller.dart';

class NextRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NextRegisterController>(
      () => NextRegisterController(),
    );
  }
}
