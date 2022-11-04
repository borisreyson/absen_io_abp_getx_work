import 'package:get/get.dart';

import '../controllers/bukti_dilokasi_controller.dart';

class BuktiDilokasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuktiDilokasiController>(
      () => BuktiDilokasiController(),
    );
  }
}
