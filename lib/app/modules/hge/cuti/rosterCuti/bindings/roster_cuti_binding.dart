import 'package:get/get.dart';

import '../controllers/roster_cuti_controller.dart';

class RosterCutiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RosterCutiController>(
      () => RosterCutiController(),
    );
  }
}
