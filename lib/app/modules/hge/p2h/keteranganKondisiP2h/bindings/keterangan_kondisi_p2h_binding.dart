import 'package:get/get.dart';

import '../controllers/keterangan_kondisi_p2h_controller.dart';

class KeteranganKondisiP2hBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KeteranganKondisiP2hController>(
      () => KeteranganKondisiP2hController(),
    );
  }
}
