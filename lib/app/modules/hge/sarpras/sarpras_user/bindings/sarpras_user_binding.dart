import 'package:get/get.dart';

import '../controllers/sarpras_user_controller.dart';

class SarprasUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SarprasUserController>(
      () => SarprasUserController(),
    );
  }
}
