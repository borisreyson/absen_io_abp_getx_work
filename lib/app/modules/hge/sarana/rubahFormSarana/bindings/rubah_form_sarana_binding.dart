import 'package:get/get.dart';

import '../controllers/rubah_form_sarana_controller.dart';

class RubahFormSaranaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RubahFormSaranaController>(
      () => RubahFormSaranaController(),
    );
  }
}
