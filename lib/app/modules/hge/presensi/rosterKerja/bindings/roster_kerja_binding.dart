import 'package:get/get.dart';

import '../controllers/roster_kerja_controller.dart';

class RosterKerjaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RosterKerjaController>(
      () => RosterKerjaController(),
    );
  }
}
