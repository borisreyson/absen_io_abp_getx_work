import 'package:get/get.dart';

import '../controllers/list_pemeriksaan_p2_h_controller.dart';

class ListPemeriksaanP2HBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListPemeriksaanP2HController>(
      () => ListPemeriksaanP2HController(),
    );
  }
}
