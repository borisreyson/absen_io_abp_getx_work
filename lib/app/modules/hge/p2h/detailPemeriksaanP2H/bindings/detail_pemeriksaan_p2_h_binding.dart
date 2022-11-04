import 'package:get/get.dart';

import '../controllers/detail_pemeriksaan_p2_h_controller.dart';

class DetailPemeriksaanP2HBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPemeriksaanP2HController>(
      () => DetailPemeriksaanP2HController(),
    );
  }
}
