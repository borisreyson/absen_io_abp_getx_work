import 'package:get/get.dart';

class BarcodeSecurityController extends GetxController {
  final noidOut = RxnString(null);

  @override
  void onInit() async {
    var noid = await Get.arguments['noidOut'];
    noidOut.value = noid;
    super.onInit();
  }
}
