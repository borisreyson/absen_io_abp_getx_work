import 'package:get/get.dart';

import '../controllers/monitoring_stock_rom_controller.dart';

class MonitoringStockRomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MonitoringStockRomController>(
      () => MonitoringStockRomController(),
    );
  }
}
