import 'package:get/get.dart';

import '../controllers/p2h_list_sarana_sarpras_controller.dart';

class P2hListSaranaSarprasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<P2hListSaranaSarprasController>(
      () => P2hListSaranaSarprasController(),
    );
  }
}
