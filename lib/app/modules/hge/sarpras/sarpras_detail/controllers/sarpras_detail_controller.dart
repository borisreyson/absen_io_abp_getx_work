import 'package:face_id_plus/app/data/models/sarpras_list.dart';
import 'package:face_id_plus/app/data/models/sarpras_penumpang.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../data/providers/provider.dart';

class SarprasDetailController extends GetxController {
  final provider = Provider();
  final noidOut = RxnString(null);
  final page = 1.obs;
  final data = Data().obs;
  final fmt = DateFormat('dd MMMM yyyy');
  final jam = DateFormat("HH:mm:ss");
  final penumpang = SarprasPenumpang().obs;
  final loaded = false.obs;
  @override
  void onInit() async {
    penumpang.value.penumpang = [];
    noidOut.value = await Get.arguments['noidOut'];
    if (noidOut.value != null) {
      await provider
          .getSarprasDetail(noidOut.value, "${page.value}")
          .then((value) {
        if (value.sarpras != null) {
          data.value = value.sarpras!;
          if (data.value.penumpangOut != null) {
            getPenumpang(data.value.penumpangOut);
          }
        }
      });
    }
    super.onInit();
  }

  getPenumpang(String? nik) async {
    await provider.getSarprasPenumpang(nik).then((value) {
      if (value != null) {
        penumpang.value = value;
        loaded.value = true;
      } else {
        loaded.value = false;
      }
    });
  }
}
