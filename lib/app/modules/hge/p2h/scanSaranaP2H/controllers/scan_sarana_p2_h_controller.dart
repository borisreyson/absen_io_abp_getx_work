import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanSaranaP2HController extends GetxController {
  final rule = RxList.empty();
  final resultQr = 'Scan Code!'.obs;
  final isStarted = true.obs;

  MobileScannerController? scanner;
  @override
  void onInit() {
    scanner = MobileScannerController();

    super.onInit();
  }

}
