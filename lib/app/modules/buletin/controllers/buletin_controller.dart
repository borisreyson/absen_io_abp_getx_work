import 'package:face_id_plus/app/modules/home/buletin_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BuletinController extends GetxController {
  final data = Data().obs;
  DateFormat fmt = DateFormat("dd MMMM yyyy");
  final tgl = RxnString(null);
  final isloading = false.obs;
  @override
  void onInit() async {
    var buletin = await Get.arguments['buletin'];
    if (buletin != null) {
      data.value = buletin;

      tgl.value = fmt.format(
        DateTime.parse("${data.value.tgl}"),
      );
      isloading.value = true;
    } else {
      isloading.value = false;
    }
    super.onInit();
  }
}
