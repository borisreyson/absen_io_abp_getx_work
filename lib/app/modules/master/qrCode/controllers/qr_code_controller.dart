import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class QrCodeController extends GetxController {
  final rule = RxList.empty();
  final resultQr = 'Scan Code!'.obs;
  final isStarted = true.obs;

  MobileScannerController? scanner;

  Future<void> gotoUrl(url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
