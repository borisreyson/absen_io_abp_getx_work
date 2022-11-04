import 'package:get/get.dart';

import '../controllers/signature_view_controller.dart';

class SignatureViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignatureViewController>(
      () => SignatureViewController(),
    );
  }
}
