import 'package:get/get.dart';

import '../controllers/form_sarana_controller.dart';

class FormSaranaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormSaranaController>(
      () => FormSaranaController(),
    );
  }
}
