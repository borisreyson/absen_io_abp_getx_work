import 'package:get/get.dart';

import '../controllers/signature_create_controller.dart';

class SignatureCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignatureCreateController>(
      () => SignatureCreateController(),
    );
  }
}
