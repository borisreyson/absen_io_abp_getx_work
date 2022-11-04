import 'package:get/get.dart';

import '../controllers/monitoring_stock_product_controller.dart';

class MonitoringStockProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MonitoringStockProductController>(
      () => MonitoringStockProductController(),
    );
  }
}
