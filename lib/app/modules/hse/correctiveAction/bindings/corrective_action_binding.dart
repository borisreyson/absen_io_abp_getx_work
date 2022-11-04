import 'package:get/get.dart';

import '../controllers/corrective_action_controller.dart';

class CorrectiveActionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CorrectiveActionController>(
      () => CorrectiveActionController(),
    );
  }
}
