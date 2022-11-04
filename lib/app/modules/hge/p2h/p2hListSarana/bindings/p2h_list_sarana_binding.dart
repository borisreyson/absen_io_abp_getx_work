import 'package:get/get.dart';

import '../controllers/p2h_list_sarana_controller.dart';

class P2hListSaranaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<P2hListSaranaController>(
      () => P2hListSaranaController(),
    );
  }
}
