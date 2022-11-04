import 'package:get/get.dart';

import '../controllers/form_izin_keluar_controller.dart';

class FormIzinKeluarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormIzinKeluarController>(
      () => FormIzinKeluarController(),
    );
  }
}
